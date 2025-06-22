"""
Local RAG chatbot over claims KPIs.
Run:  python ai/agent_rag.py
"""

import os
import pandas as pd
import faiss
from sentence_transformers import SentenceTransformer
from langchain.llms import OpenAI
from langchain.chains import RetrievalQA
from langchain.vectorstores import FAISS
import snowflake.connector as sf

# ── 1 connect to Snowflake and pull KPI view ──────────
conn = sf.connect(
    user="YOUR_USER",
    password="YOUR_PASSWORD",
    account="YOUR_ACCOUNT",
    warehouse="YOUR_WAREHOUSE",
    database="RCM_LAB",
    schema="PUBLIC",
)
kpi_df = pd.read_sql("select * from v_claims_kpis order by claim_month", conn)

# ── 2 turn each row into a plain-text doc ─────────────
docs = [
    f"In {row.claim_month:%Y-%m}, total claims were {row.total_claims}"
    for row in kpi_df.itertuples()
]

# ── 3 embed and index with FAISS ──────────────────────
embedder = SentenceTransformer("all-MiniLM-L6-v2")
embeddings = embedder.encode(docs)
index = faiss.IndexFlatL2(embeddings.shape[1])
index.add(embeddings)
vector_store = FAISS(index, docs)

# ── 4 wire up Retrieval-QA with OpenAI (or another LLM) ─
qa = RetrievalQA.from_chain_type(
    llm=OpenAI(temperature=0.0),
    chain_type="stuff",
    retriever=vector_store.as_retriever()
)

# ── 5 simple CLI loop ─────────────────────────────────
print("RAG chatbot ready. Ask about monthly claim volume.")
while True:
    q = input("🡆 ")
    if q.lower() in {"exit", "quit"}:
        break
    print(qa.run(q))
