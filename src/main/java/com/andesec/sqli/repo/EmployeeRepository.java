package com.andesec.sqli.repo;

import com.andesec.sqli.model.Employee;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class EmployeeRepository {
    private final DataSource dataSource;

    /* ✗ VULNERABLE dynamic SQL  ----------------------------------------- */
    public List<Employee> findInsecure(String mgr, String term) throws SQLException {
        String sql = "SELECT * FROM employees WHERE manager = '" + mgr + "' AND name LIKE '%" + term + "%'";

        try (Statement st = dataSource.getConnection().createStatement(); ResultSet rs = st.executeQuery(sql)) {
            return map(rs);
        }
    }

    /* ✓ SAFE prepared-statement version  -------------------------------- */
    public List<Employee> findSecure(String mgr, String term) throws SQLException {
        String sql = "SELECT * FROM employees WHERE manager = ? AND name LIKE ?";

        try (Connection c = dataSource.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, mgr);
            ps.setString(2, "%" + term + "%");
            try (ResultSet rs = ps.executeQuery()) {
                return map(rs);
            }
        }
    }

    /* helper ------------------------------------------------------------ */
    private List<Employee> map(ResultSet rs) throws SQLException {
        List<Employee> list = new ArrayList<>();
        while (rs.next()) {
            list.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("manager")
            ));
        }
        return list;
    }
}