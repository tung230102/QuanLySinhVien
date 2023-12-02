using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace QuanLySinhVien
{
    public partial class frmWelcome : Form
    {
        public frmWelcome()
        {
            InitializeComponent();
            ThongKeSoluong();
            LoadDiem();
            LoadXepHang();
        }

        private void frmWelcome_Load(object sender, EventArgs e)
        {
            ThongKeSoluong();
            LoadDiem();
            LoadXepHang();
        }

        private void ThongKeSoluong()
        {
            SqlConnection conn = Database.Connect();

            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tblSinhVien", conn);
            int countSinhVien = (int)command.ExecuteScalar();
            lbTongSinhVien.Text = countSinhVien.ToString();

            command = new SqlCommand("SELECT COUNT(*) FROM tblGiaoVien", conn);
            int countGiaoVien = (int)command.ExecuteScalar();
            lbTongGiaoVien.Text = countGiaoVien.ToString();

            command = new SqlCommand("SELECT COUNT(*) FROM tblMonHoc", conn);
            int countMonHoc = (int)command.ExecuteScalar();
            lbTongMonHoc.Text = countMonHoc.ToString();

            command = new SqlCommand("SELECT COUNT(*) FROM tblLopHoc", conn);
            int countLopHoc = (int)command.ExecuteScalar();
            lbTongLopHoc.Text = countLopHoc.ToString();

            conn.Close();
        }

        private void LoadDiem()
        {
            try
            {
                SqlConnection conn = Database.Connect();

                SqlCommand cmd = new SqlCommand("selectDiemTongKetHocPhan", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();

                // Xóa dữ liệu cũ trên biểu đồ
                chartDiemSV.Series.Clear();

                // Tạo dòng dữ liệu cho biểu đồ
                Series series = new Series("Điểm trung bình");
                series.ChartType = SeriesChartType.Column;

                // Thêm dữ liệu từ SqlDataReader vào dòng
                while (reader.Read())
                {
                    string maSinhVien = reader.GetString(reader.GetOrdinal("masinhvien"));
                    double diemTrungBinh = reader.GetDouble(reader.GetOrdinal("DiemTrungBinh"));

                    DataPoint dataPoint = new DataPoint();
                    dataPoint.SetValueXY(maSinhVien, diemTrungBinh);
                    dataPoint.Label = string.Format("{0}: {1:N2}", maSinhVien, diemTrungBinh);
                    series.Points.Add(dataPoint);
                }

                // Thêm dòng vào biểu đồ
                chartDiemSV.Series.Add(series);

                // Đặt tên trục x và trục y
                chartDiemSV.ChartAreas[0].AxisX.Title = "Mã Sinh Viên";
                chartDiemSV.ChartAreas[0].AxisY.Title = "Điểm Trung Bình";

                // Cập nhật biểu đồ
                chartDiemSV.Update();

                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải dữ liệu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void LoadXepHang()
        {
            try
            {
                SqlConnection conn = Database.Connect();

                SqlCommand cmd = new SqlCommand("selectXepLoaiSinhVien", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader reader = cmd.ExecuteReader();

                chart1.Series.Clear();

                chart1.Series.Add("ScoreDistribution");
                chart1.Series["ScoreDistribution"].ChartType = SeriesChartType.Pie;

                while (reader.Read())
                {
                    string scoreCategory = reader.GetString(reader.GetOrdinal("XepLoai"));
                    int count = reader.GetInt32(reader.GetOrdinal("Count"));

                    chart1.Series["ScoreDistribution"].Points.AddXY(scoreCategory, count);
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải dữ liệu : " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
