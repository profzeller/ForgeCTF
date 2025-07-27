# ForgeCTF

A self-hosted AI-powered platform to help cybersecurity instructors create and manage labs and CTF challenges.

---

## 🚀 Getting Started

### 🛠 Requirements
- Docker + Docker Compose (or Portainer)
- Optional: Packer + Proxmox (for VM deployment)

---

### 🔧 1. Clone the repo

```bash
git clone https://github.com/YOURUSER/ForgeCTF.git
cd ForgeCTF
```

---

### 🌱 2. Set up your environment

ForgeCTF supports both **development** and **production** environments using `.env` files.

Start by creating a local dev `.env`:

```bash
cp .env.example .env
```

Then edit `.env` as needed for your local ports, etc.

---

### 🐳 3. Start the containers

**Development (local desktop / PyCharm):**
```bash
docker-compose --env-file .env up -d
```

**Production (Portainer or remote Docker):**
```bash
docker-compose --env-file .env.production up -d
```

---

### 📦 4. (Optional) Download a model

You can pull a model into Ollama using:

```bash
bash setup/download-model.sh mistral
```

---

### 💬 5. Use AnythingLLM

- Visit [http://localhost:3001](http://localhost:3001) (or your mapped port)
- Upload PDFs into the `data/` folder
- Ask questions about the lab content or request CTF challenges!

---

### 🎯 6. Use CTFd

- Visit [http://localhost:8000](http://localhost:8000) (or your mapped port)
- Log in as admin
- Use `generate_ctfd_yaml.py` to create YAML challenges
- Import into CTFd via Admin > Challenges > Import

---

## 📁 Project Structure

```
ForgeCTF/
├── docker-compose.yml               # Main stack (AnythingLLM + Ollama + CTFd)
├── .env                             # Development environment config
├── .env.production                  # Production (Portainer-friendly)
├── .env.example                     # Template env file
├── README.md                        # Setup instructions
├── data/                            # PDF docs for ingestion
├── scripts/
│   └── generate_ctfd_yaml.py        # Export challenges to CTFd format
├── setup/
│   ├── init-data.sh                 # Optional seeding logic
│   └── download-model.sh            # Pulls model into Ollama
```

---

## 🧠 Use Cases

- Ask questions about lab PDF content
- Automatically generate CTF challenge ideas with flags and hints
- Export challenges as YAML for CTFd
- Build auto-provisioned lab environments via Proxmox + Packer

---

## 🛠 Model Options

You can use any model compatible with Ollama. Recommended models:

- `mistral`
- `codellama`
- `deepseek-coder`
- `llama3`

To pull a model:
```bash
ollama pull mistral
```

---

## 🔄 Environment Configs

### `.env` (development)
Used for local testing and Docker Desktop.

### `.env.production` (production/Portainer)
Used when deploying to a remote server or in Portainer UI.

You can switch by just running:

```bash
docker-compose --env-file .env.production up -d
```

---

## 🧰 Coming Soon

- CLI tool to export ForgeCTF challenges to CTFd
- Packer template for deploying ForgeCTF as a Proxmox-ready VM
- Instructor UI for managing labs and generating content faster

---

## 👨‍🏫 Built for Cybersecurity Instructors

ForgeCTF helps instructors focus on teaching while automating the content generation, hint creation, and CTF deployment process.

💡 **Contributions welcome!**
