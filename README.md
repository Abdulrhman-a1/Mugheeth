
# 🏥 Mugheeth - AI-Powered Triage Assistant (Flutter App)

**Mugheeth** is a mobile application built with **Flutter** that allows users to describe their medical symptoms in natural language.  
The system engages in a short diagnostic conversation, then provides a professional triage classification using AI.

---

## 🚀 Features

- 💬 Dynamic medical chat interface
- 🧠 AI-powered triage logic using LLaMA 3.2 (via Ollama)
- 🌐 REST API integration with FastAPI backend
- 📱 Fully responsive Flutter UI 
- 🌙 English & Arabic language support

---

## 🧠 How It Works

1. User describes their symptoms through a chat screen
2. The app sends the message to a FastAPI server
3. The server forwards it to a local LLaMA 3.2 model via Ollama
4. The model responds with a follow-up question or a final triage result
5. The app displays the full classification like this:

## tools used 
1. VS code
2. Subapace

---

## 🛠 Installation & Setup

### ⚙️ Prerequisites

- Flutter SDK (3.12 or above recommended)
- Dart
- Android Studio / VS Code
- Backend:
  - Python 3.10+
  - Ollama (LLaMA 3.2 installed)
  - FastAPI
  - Ollama

---

### 🔧 Step 1: Clone the project

### 🔧 Step 2: Install Flutter dependencies

```bash
flutter pub get
```

---

### 🔧 Step 3: Setup and run backend

1. Make sure Python + Ollama + FastAPI installed
2. Pull LLaMA 3.2:

```bash
ollama pull llama3
```

3. Start your FastAPI backend:

```bash
uvicorn main_llm_api:app --host 0.0.0.0 --port 8000
```

---

### 🔧 Step 4: Run Flutter app

https://drive.google.com/file/d/1JHbdlBDVMPpuSRZtU90lYTM9tLzg3lje/view?usp=sharing

---

## 👨‍💻 Developed By

- Abdulrahman Albusaad 
- Wael Alessa
- Mahdi Alzakari 
- Ali Assulitian 


