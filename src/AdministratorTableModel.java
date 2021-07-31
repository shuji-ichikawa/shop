package shop;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AdministratorTableModel implements Serializable {
	private String administrator_id;
	private String password;

	public String getAdministrator_id() {
		return administrator_id;
	}
	public void setAdministrator_id(String administrator_id) {
		this.administrator_id = administrator_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public final static int match = 1;
	public final static int difference = 0;


	//★
	public static int LoginCheck(String administrator_id, String password){
		ArrayList<AdministratorTableModel> rlist = selectAllList();
		AdministratorTableModel rbean = null;

		for(int i = 0; i< rlist.size() ; i++) {
			rbean = (AdministratorTableModel)rlist.get(i);
			if ( administrator_id.equals(rbean.getAdministrator_id()) ) {
				if (password.equals(rbean.getPassword())) {
					return match;
				}
				return difference;
			}
		}
		return difference;
	}

	//★
	public static ArrayList<AdministratorTableModel> selectAllList(){
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;

		ArrayList<AdministratorTableModel> alist = new ArrayList<AdministratorTableModel>();

		try {
			conn = new ResourceFinder().getConnectionpuser();
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM administrator");

			while (rs.next()){

				AdministratorTableModel a_model = new AdministratorTableModel();
				a_model.setAdministrator_id(rs.getString("administrator_id"));
				a_model.setPassword(rs.getString("password"));
				alist.add(a_model);
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}

		return alist;
	}
}