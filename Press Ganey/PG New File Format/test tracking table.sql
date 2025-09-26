CREATE TABLE survey_file_history (
    record_id SERIAL PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    encounter_date DATE NOT NULL,
    event_type VARCHAR(100),
    survey_type VARCHAR(50),
    file_name VARCHAR(255),
    batch_id VARCHAR(100),
    sent_status BOOLEAN DEFAULT FALSE,
    sent_timestamp TIMESTAMP,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Indexes to improve query performance
CREATE INDEX idx_patient_id ON survey_file_history(patient_id);
CREATE INDEX idx_encounter_date ON survey_file_history(encounter_date);
CREATE INDEX idx_sent_status ON survey_file_history(sent_status);
