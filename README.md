# ForgeCTF

A self-hosted AI-powered platform to help cybersecurity instructors create and manage labs and CTF challenges.

---

## 🚀 Getting Started

1. **Clone the repo:**

   ```bash
   git clone https://github.com/YOURUSER/ForgeCTF.git
   cd ForgeCTF
   ```

2. **Start the stack:**

   ```bash
   docker-compose up -d
   ```

3. **(Optional) Download a model:**

   ```bash
   bash setup/download-model.sh mistral
   ```

4. **Visit AnythingLLM:**

   - Go to [http://localhost:3001](http://localhost:3001)
   - Upload PDFs into the `data/` folder (already mounted)
   - Chat with your lab documents!

---

## 📁 Project Structure

```
ForgeCTF/
├── docker-compose.yml        # Main stack for AnythingLLM + Ollama
├── .env                      # Optional env vars for customization
├── README.md                 # Setup instructions
├── setup/                    # Initialization scripts or provisioning
│   ├── init-data.sh
│   └── download-model.sh
├── data/                     # Folder for instructors to drop PDFs
├── scripts/                  # Optional scripts for CTFd export etc.
│   └── generate_ctfd_yaml.py
```

---

## 🧠 Use Cases

- Ask questions about lab PDF content
- Automatically generate CTF challenge ideas
- Export challenges to CTFd-compatible YAML/JSON
- Build lab environments with flags using Proxmox + Packer

---

## 🛠 Model Options

Use any model compatible with Ollama. Recommended for speed and accuracy:
- `mistral`
- `codellama`
- `deepseek-coder`
- `llama3` (for deeper generation)

---

## 🧰 Coming Soon

- CLI tool to export ForgeCTF challenges to CTFd
- Packer template for deploying ForgeCTF as a Proxmox-ready VM
- Web-based instructor tools for managing labs

---

## 👨‍🏫 Built for Cybersecurity Instructors

ForgeCTF helps instructors focus on teaching while automating the content generation, hint creation, and CTF deployment process.

Contributions welcome!
