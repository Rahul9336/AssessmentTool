package patientdto;

public class Patient {
	Long patient_id ;
	   String patient_name ;
	   Integer patient_age ;
	   String patient_sex ;
	   String patient_assessmentdate ;
	   String patient_diagnosis ;
	   String patient_addr ;
	   String patient_contact ;
	   String patient_therapist;
	   String status;
	   
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(Long patient_id) {
		this.patient_id = patient_id;
	}
	public String getPatient_name() {
		return patient_name;
	}
	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}
	public Integer getPatient_age() {
		return patient_age;
	}
	public void setPatient_age(Integer patient_age) {
		this.patient_age = patient_age;
	}
	public String getPatient_sex() {
		return patient_sex;
	}
	public void setPatient_sex(String patient_sex) {
		this.patient_sex = patient_sex;
	}
	public String getPatient_assessmentdate() {
		return patient_assessmentdate;
	}
	public void setPatient_assessmentdate(String patient_assessmentdate) {
		this.patient_assessmentdate = patient_assessmentdate;
	}
	public String getPatient_diagnosis() {
		return patient_diagnosis;
	}
	public void setPatient_diagnosis(String patient_diagnosis) {
		this.patient_diagnosis = patient_diagnosis;
	}
	public String getPatient_addr() {
		return patient_addr;
	}
	public void setPatient_addr(String patient_addr) {
		this.patient_addr = patient_addr;
	}
	public String getPatient_contact() {
		return patient_contact;
	}
	public void setPatient_contact(String patient_contact) {
		this.patient_contact = patient_contact;
	}
	public String getPatient_therapist() {
		return patient_therapist;
	}
	public void setPatient_therapist(String patient_therapist) {
		this.patient_therapist = patient_therapist;
	}

}
