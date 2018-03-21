package patientdaoimpl;

import java.sql.*;

import patientconfig.dbcon;
import patientdto.Patient;

public class Registerimpl {
	public static boolean add(Patient patient) {
		try{
			Connection con=dbcon.getCon();
            PreparedStatement ps=con.prepareStatement("insert into patient_details(patient_id,patient_name,patient_age,patient_sex,patient_assessmentdate,patient_diagnosis,"
            		+ "patient_addr,patient_contact,patient_therapist,status)value(?,?,?,?,?,?,?,?,?,'activated')");
			ps.setLong(1,patient.getPatient_id());
			ps.setString(2,patient.getPatient_name());
			ps.setLong(3,patient.getPatient_age());
			ps.setString(4, patient.getPatient_sex());
			ps.setString(5, patient.getPatient_assessmentdate());
			ps.setString(6, patient.getPatient_diagnosis());
			ps.setString(7, patient.getPatient_addr());
			ps.setString(8, patient.getPatient_contact());
			ps.setString(9, patient.getPatient_therapist());
			ps.executeUpdate();
			return true;
		}catch(Exception e){
			return false;
		}
					}
	
	static String values;
	public static boolean status(Long id) {
		try {
			Connection con=dbcon.getCon();
			PreparedStatement statement =con.prepareStatement("Select status from patient_details where patient_id=?");
			statement.setLong(1, id);
			ResultSet rs=statement.executeQuery();
			while(rs.next()) {
				values=rs.getString("status");
			System.out.println(values);
		}
			boolean check= values.equals("activated");
			return check;
			}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
	}
	static Patient patient =new Patient();
	public static Patient getdetail(Long id) {
		try {
			
			Connection con=dbcon.getCon();
			PreparedStatement statement =con.prepareStatement("Select * from patient_details where patient_id=?");
			statement.setLong(1,id);
			ResultSet rs=statement.executeQuery();
			while(rs.next()) {
				String s=rs.getString("patient_id");
				Long newid= Long.parseLong(s);
				patient.setPatient_id(newid);
			patient.setPatient_addr(rs.getString("patient_addr"));
			patient.setPatient_age(rs.getInt("patient_age"));
			patient.setPatient_assessmentdate(rs.getString("patient_assessmentdate"));
			patient.setPatient_contact(rs.getString("patient_contact"));
			patient.setPatient_name(rs.getString("patient_name"));
			patient.setPatient_therapist(rs.getString("patient_therapist"));
			patient.setStatus(rs.getString("status"));
			System.out.println(patient.getStatus());
			return patient;
			}
			System.out.println(patient.getStatus());
			return patient;
		}
		catch(Exception e){
			e.printStackTrace();
			return patient;
		}
	}
	public static void main(String args[]) {
		Registerimpl r=new Registerimpl();
		 Patient patient=r.getdetail(new Long(55626));
		System.out.println(patient.getPatient_id());
	}
	}


