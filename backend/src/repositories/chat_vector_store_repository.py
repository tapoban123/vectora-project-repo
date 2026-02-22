import tiktoken
from langchain_google_genai import GoogleGenerativeAIEmbeddings
from langchain_pinecone import PineconeVectorStore
from langchain_text_splitters import RecursiveCharacterTextSplitter
from pinecone import Pinecone

from src.core.common import get_langchain_gemini_embedding
from src.core.constants import GEMINI_CHAT_MODEL

pinecone = Pinecone(api_key="")


def create_index_name(uid: str, cid: str):
    """Creates the vector store index name from uid and cid."""
    return f"{uid}_{cid}"


class ChatVectorStoreRepository:
    def __init__(self, uid: str, cid: str):
        self.index_name = create_index_name(uid, cid=cid)
        self.vector_store = PineconeVectorStore(index=self.index_name, embedding=get_langchain_gemini_embedding())

    def store_context(self, context: str):
        pass

    def split_text_on_token_count(self, content: str):
        encoding = tiktoken.encoding_for_model(model_name=GEMINI_CHAT_MODEL)
        tokens_count = len(encoding.encode(content))

        if tokens_count <= 300:
            return content

        chunk_size: int
        overlap: int
        if tokens_count <= 1000:
            chunk_size = 600
            overlap = 80

        else:
            chunk_size = 900
            overlap = 150

        splitter = RecursiveCharacterTextSplitter(
            chunk_size=chunk_size,
            chunk_overlap=overlap,
            separators=["\n\n", "\n", ".", " ", ""],
        )
        return splitter.split_text(content)
