# Vectora

Vectora is an AI-powered personal content manager built to make your documents searchable, intelligent, and interactive.

It allows you to upload PDFs, images, and notes, perform semantic search using embeddings, and chat with your own content in a natural way. The goal is simple: turn static files into something you can actually think with.

> ⚠️ This project is currently under active development.

---

## ✨ What Vectora Does

- Upload PDFs, images, and text notes
- Generate embeddings for semantic search
- Perform fast, relevant similarity-based search
- Chat with individual documents using AI
- Pin, tag, archive, and filter content
- Local-first storage for user documents
- Privacy-focused architecture

Vectora is designed to feel minimal, professional, and distraction-free — not like a file manager, but like a thinking tool.

---

## 🧠 How It Works (High-Level)

- Files are stored locally on the device.
- Extracted text is chunked and converted into embeddings.
- Embeddings are stored locally for fast similarity search.
- When you search, a query embedding is compared against stored vectors.
- For chat, relevant content is retrieved and sent to an AI model for contextual reasoning.

The system is built with performance, scalability, and cost-awareness in mind.

---

## 🏗️ Tech Stack

**Frontend**
- Flutter
- ObjectBox (vector storage)
- Pinecone (Chat context temporary storage)
- Firebase Authentication
- Firebase Analytics
- Google AdMob

**Backend**
- FastAPI
- AWS Lambda + API Gateway
- Gemini API for AI processing

**Payments**
- Razorpay (metadata only stored)

---

## 📦 Current Status

Vectora is still in development. Core architecture, data flow, embedding pipeline, and monetization model are being actively refined.

Planned milestones include:
- Complete local processing pipeline
- Robust job recovery system
- Production-ready pricing and subscription flow
- Security hardening
- Performance optimization

---

## 🔐 Privacy Approach

Vectora is built with a local-first philosophy.  
User documents are stored on-device.

All contents are sent to external APIs for embedding generation or AI processing. See the [Privacy Policy](https://sites.google.com/view/vectora-privacy-policy/home) for full details.

---

## 🎯 Why This Project Exists

Most document apps store your files.  
Very few help you *reason* with them.

Vectora is an experiment in building a personal knowledge system that is:
- Intelligent
- Minimal
- Technically rigorous
- Transparent in design decisions

This repository reflects ongoing work in system design, AI integration, and product architecture.

---

## 🚧 Roadmap

- Improved embedding optimization
- Advanced filtering
- Performance tuning
- UX refinements
- Enhanced export features

---

## 🤝 Contributing

This project is currently maintained by the author.  
Discussions and issues are welcome.

---

## 📄 License

License will be added soon.

---

**Built and maintained by Tapoban Ray**
