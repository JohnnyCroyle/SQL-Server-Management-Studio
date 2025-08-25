# SQL Server Management Studio Project


# Press Ganey InfoTurn Technical Transmission Instructions

This README provides a comprehensive summary of the Press Ganey InfoTurn Technical Transmission Instructions.

## 📌 Purpose
This guide outlines how healthcare facilities should prepare and transmit patient data to Press Ganey for survey administration.

## 👥 Key Roles
- **IT Contact**: Responsible for data extraction and transmission.
- **Primary Contact**: Coordinates internal data needs and works with Press Ganey.
- **Application Specialist**: Advises on data inclusion and setup.
- **EDI Specialist**: Supports data transmission and file review.

## 🧪 Test File Setup
- Create and send a test file before transmitting live data.
- Include real patient data and a file layout.
- Upload to the MFT Test folder.
- Receive feedback and approval from Press Ganey.

## 📁 File Formats
- Accepted formats: Fixed format, CSV, Excel CSV.
- Max record length: 1000 characters.
- End-of-record marker: `$`
- No null characters or tab-delimited files.

## 🔐 Transmission Methods
- Secure protocols: SFTP, FTPS, HTTPS.
- Use the Press Ganey File Transfer Portal: https://pgds.pressganey.com
- Credentials are sent via email.
- PHI must not be sent via email.

## 📊 Required Fields
Includes:
- Survey Designator, Client ID
- Patient Name, Address, DOB
- Contact Info (Phone, Email)
- Visit/Discharge Dates
- Medical Record Number
- Language
- End-of-record marker (`$`)

## 🧬 Race & Ethnicity Standards
- Use text-based values (e.g., "Asian")
- Separate fields for Race and Ethnicity
- Include "Prefer not to answer", "Other", "Two or more races"

## 🏥 Eligibility Codes
- Specific codes for HCAHPS and OAS CAHPS
- Flags for exclusion: Deceased, No Publicity, State Regulation

## 🔄 Update Files
- Used to correct or complete patient records
- Must include "UPDATE" in the filename
- Only certain fields can be updated
- Must match original layout and identifiers

## 🌐 Survey Language Codes
- Supported languages include: English, Spanish, Chinese, Vietnamese, Arabic, Russian, etc.
- Each language has a numeric code to be used in the Language field

## 🛠️ Support
- Contact EDI team: 888.773.7742
- Keep copies of all transmitted files
- InfoTurn Results Files available for upload tracking

## 📚 Glossary
- **Client ID**: Unique identifier for each facility
- **Survey Designator**: Code indicating survey version
- **EOR**: End-of-record marker (`$`)
- **PGP**: Encryption software for secure data transmission
- **MFT**: Managed File Transfer system used by Press Ganey

