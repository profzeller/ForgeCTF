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

### 📦 4. Default Model Handling

When the stack starts, ForgeCTF automatically pulls the `mistral` model using Ollama (CPU-friendly). No manual setup required.

If you want to change the model, edit your `.env` file and update:

```env
DEFAULT_MODEL=mistral
```

Then restart:

```bash
docker-compose down
docker-compose --env-file .env up -d
```

---

### 💬 5. Use AnythingLLM

- Visit [http://localhost:3001](http://localhost:3001) (or your mapped port)
- Upload PDFs into the `data/` folder
- Ask questions about the lab content or request CTF challenges!

---

## 💬 Using AnythingLLM

Once the stack is running, use AnythingLLM to extract insights and generate challenges from your lab PDFs.

### 🔓 1. Log In

- Go to: [http://localhost:3001](http://localhost:3001)
- On your first visit, create an admin user and a workspace.

### 📂 2. Upload or Auto-Load Lab PDFs

- Place PDFs into the `./data/` folder. This folder is automatically mounted and scanned by AnythingLLM.
- Alternatively, you can upload documents directly through the web UI.

### 🧠 3. Ask Smart Questions

In your workspace, use the chat interface to ask targeted questions. Here are some helpful prompts:

| Goal | Prompt |
|------|--------|
| **Summarize a lab** | "Summarize this lab in bullet points. What tools are used and what’s the goal?" |
| **Extract commands** | "What commands are used for network scanning in this lab?" |
| **Generate a challenge** | "Create a CTF challenge based on this lab. Include title, flag, description, and hint." |
| **Check knowledge** | "What should students learn from this lab?" |

### ✨ Best Practices

- Use specific prompts (e.g., “Format the flag as `flag{}`”)
- Include structure if you're generating CTFd content
- Save output as Markdown or copy into your YAML generator

### 🔁 Workflow Example

```text
1. Drop Lab01_Basics.pdf into ./data/
2. Visit http://localhost:3001 and select the document
3. Ask: "Generate a challenge with title, description, flag, and hint."
4. Copy the output
5. Run: python scripts/generate_ctfd_yaml.py ...
6. Import YAML into CTFd
```

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
│   ├── download-model.sh            # CLI model installer (optional)
│   └── entrypoint.sh                # Automatic pull + serve for Ollama
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

To pull a model manually:
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

---

## 📝 License

ForgeCTF is licensed under the **Business Source License 1.1 (BSL)**.

- ✅ Free for non-commercial, educational, and personal use
- ❌ Commercial use or hosted deployment requires written permission
- 🔓 Converts to Apache 2.0 on **2028-07-27**

See the [LICENSE](./LICENSE) file for full terms.
