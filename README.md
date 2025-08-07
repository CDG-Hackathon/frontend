# Cura Q – CDG Hackathon 2025 🏥⚡

**Cura Q** is an AI-powered healthcare queue management and patient onboarding platform designed for Thai public hospitals. Developed for the **CDG Hackathon 2025**, this full-stack project features a **Flutter frontend** and **NestJS (Node.js with TypeScript)** backend, integrating biometric identity verification, real-time queue analytics, and LLM-driven triage.

---

## 🧠 Overview

> Connecting patients, hospitals, and data to reduce queue time, improve healthcare efficiency, and bring AI into the Thai public health system.

- Reduces patient wait times by 20–30%
- Provides AI-based triage recommendations
- Enables national cloud-based patient data sync
- Integrates Thai ID, facial recognition, and hand biometrics (eKYC)

---

## 🚀 Features

- ✅ **AI Hospital Recommendation & Triage** via Eir-8B
- ✅ **eKYC Identity Verification** (OCR + Thai ID + Biometrics)
- ✅ **Real-Time Queue Checking & Load Balancing**
- ✅ **Cloud-Based Health Record Sync** across hospitals
- ✅ **Telemedicine Suggestion** for non-critical cases

---

## 📄 Tech Stack

### Frontend: Flutter
- Mobile-first cross-platform interface
- API integration with backend
- Thai localization and biometric camera support

### Backend: NestJS (Node.js + TypeScript)
- Modular architecture for scalability
- RESTful APIs with JWT Auth
- Thai ID OCR + Face Detection + OTP

### AI/ML:
- **Eir-8B** Thai Clinical LLM (Fine-tuned LLaMA 3)
- **RAG**: LlamaIndex + LangChain + Haystack
- **ML**: XGBoost + AutoGluon for stroke risk prediction

---

## 📚 How It Works

1. **User Onboards** with Thai ID, selfie, and OTP
2. **LLM Analyzes Symptoms** and suggests hospitals or telemedicine
3. **User Books Queue** at selected facility
4. **Hospital Staff Accesses Data** via central cloud
5. **User Verifies Identity Onsite** via hand biometrics or face

---

## 🚧 Setup Instructions

### Backend
```bash
cd backend
npm install
npm run start:dev
```

### Frontend
```bash
cd frontend
flutter pub get
flutter run
```

---

## 💼 Business Model

- **B2G SaaS Licensing**
- Tiered pricing for hospitals (Small/Medium/Large)
- Hybrid setup: Setup Fee + Monthly Subscription + Transaction Fees
- Example: 50,000 THB/month/hospital avg.

---

## 💼 Impact Metrics

| Metric | Value |
|--------|-------|
| Wait Time Reduction | 8.5 mins/patient |
| National Time Saved | 20.2M hours/year |
| Economic Impact | 4B+ THB/year |
| Staff Time Saved | ~3,500 hours/hospital/year |

---

## 👨‍💼 Team: FA AND FIRM

- **Phimnara Ketkaew (Fa)** – PM / Flutter Dev
- **Natapat Raungput (Ice)** – Backend Engineer
- **Thanasak Songsri (Ohm)** – Flutter Dev / AI researcher
- **Nopparath Nonraksanukul (New)** – Flutter Dev

---

## 🔧 Future Work

- HL7 FHIR integration
- Telemedicine service plug-in
- Insurance claim APIs
- Privacy-preserving Federated Learning (FL)

---

## ✉️ Contact
Feel free to reach out or contribute! Pull requests welcome. 

**Repo maintained by Team FA AND FIRM for Hackathon 2025.**
