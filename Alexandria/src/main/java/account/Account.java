package account;
import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Account {

		private Integer id;
		
		private String userName;
		
		private String email;
		
		private String checkedOutString;
		
	    private Map<String, Object> checkedOut;
		
		private String password;

		public Account() {
			
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Map<String, Object> getCheckedOutBooks() {
			return checkedOut;
		}

		public void setCheckedOutBooks(Map<String, Object> checkedOutBooks) {
			this.checkedOut = checkedOutBooks;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
		
	    private static final ObjectMapper objectMapper = new ObjectMapper();
		
		public void serialize() throws JsonProcessingException {
	        this.checkedOutString = objectMapper.writeValueAsString(checkedOut);
	    }

	    public void deserialize() throws IOException {
	    	if (this.checkedOutString != null) {	    		
	    		this.checkedOut = objectMapper.readValue(checkedOutString, Map.class);
	    	}
	    }
	    
	    public String getSerialized() {
	    	System.out.println(checkedOutString);
	    	return checkedOutString;
	    }
	    
	    public void setCheckedOutString(String json) {
	    	this.checkedOutString = json;
	    }
	    	    
}