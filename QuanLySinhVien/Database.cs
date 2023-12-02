using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien
{
    public class Database
    {
        private static string connetionString = "Data Source=hp\\SERVER;Initial Catalog=QuanLySinhVien;Integrated Security=True";
        private SqlConnection conn;
        private DataTable dt;
        private SqlCommand cmd;

        public Database()
        {
            try
            {
                conn = new SqlConnection(connetionString);
            }
            catch (Exception ex) {
                MessageBox.Show("Lỗi kêt nối: " + ex.Message);
            }
        }

        public DataTable SelectData(string sql, List<CustomParameter> lstPara)
        {
            try
            {
                conn.Open();
                cmd = new SqlCommand(sql, conn);//nội dung sql được truyền vào
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var para in lstPara)
                {
                    cmd.Parameters.AddWithValue(para.key, para.value);
                }
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load dữ liệu: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();
            }
        }

        public DataRow Select(string sql)
        {
            try
            {
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt.Rows[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load thông tin chi tiết: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();
            }
        }

        public DataRow Select(string storedProcedure, List<CustomParameter> lstPara)
        {
            try
            {
                conn.Open();
                cmd = new SqlCommand(storedProcedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach (var para in lstPara)
                {
                    cmd.Parameters.AddWithValue(para.key, para.value);
                }

                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());

                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0];
                }
                else
                {
                    MessageBox.Show("No data returned from the stored procedure.");
                    return null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();
            }
        }


        public int ExeCute(string sql, List<CustomParameter> lstPara)
        {
            try
            {
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var p in lstPara)
                {
                    cmd.Parameters.AddWithValue(p.key, p.value);
                }
                var rs = cmd.ExecuteNonQuery();
                return (int)rs;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi thực thi câu lệnh: " + ex.Message);
                return -100;
            }
            finally 
            { 
                conn.Close();
            }
        }
        public static SqlConnection Connect()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connetionString;

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi kết nối: " + ex.Message);
            }

            return con;
        }
    }
}
