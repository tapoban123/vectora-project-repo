def is_context_exists(cid: str, uid: str):
    """Checks if the context of the content exists in Pinecone or not."""
    pass


def create_chat_context(content: str, cid: str, uid: str):
    """Embed the content in Pinecone db and create record on dynamodb."""
    pass


def delete_chat_context(cid: str, uid: str):
    """Deletes the chat context after 24 hours; invoked by AWS scheduler."""
    pass


def reply_user_message(cid: str, uid: str, user_message: str):
    """
    - Embed user message,
    - perform semantic search on pinecone index to get context of message.
    - Return response of AI."""
    pass
