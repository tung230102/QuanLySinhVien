using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien
{
    public partial class frmSinhVien : Form
    {
        public frmSinhVien(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }
        private string msv;
        private void frmSinhVien_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(msv)) //neesus không có msv => thêm mới sinh viên
            {
                this.Text = "Thêm mới sinh viên";
            }
            else
            {
                this.Text = "Cập nhật thông tin sinh viên";
                // lấy thông tin chi tiết của 1 sinh viên dựa vào msv
                // msv là mã sinh viên được truyền từ gỏm dssv
                var r = new Database().Select(string.Format("selectSinhVien '" + msv +"' "));
                //MessageBox.Show(r[0].ToString());

                txtHoTen.Text = r["hoten"].ToString();
                mtbNgaySinh.Text = r["ngaysinh"].ToString();
                if (int.Parse(r["gioitinh"].ToString()) == 1)
                {
                    rbtNam.Checked = true;
                }
                else
                {
                    rbtNu.Checked = true;
                }
                txtQueQuan.Text = r["quequan"].ToString();
                txtDiaChi.Text = r["diachi"].ToString();
                txtDienThoai.Text = r["dienthoai"].ToString();
                txtHoTen.Text = r["hoten"].ToString();
                txtEmail.Text = r["email"].ToString();
            }

        }

       
        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            string hoten = txtHoTen.Text;
            DateTime ngaysinh;
            string gioitinh = rbtNam.Checked ? "1" : "0";
            string quequan = txtQueQuan.Text;
            string diachi = txtDiaChi.Text;
            string dienthoai = txtDienThoai.Text;
            string email = txtEmail.Text;

            if (string.IsNullOrEmpty(hoten))
            {
                MessageBox.Show("Họ tên không được để trống");
                txtHoTen.Select();
                return;
            }
            try
            {
                ngaysinh = DateTime.ParseExact(mtbNgaySinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {
                MessageBox.Show("Ngày sinh không hợp lệ, ngày sinh phải đúng định dạng VD(23/01/2002)");
                mtbNgaySinh.Select();
                return;
            }
            if (string.IsNullOrEmpty(quequan))
            {
                MessageBox.Show("Quê quán không được để trống");
                txtQueQuan.Select();
                return;
            }
            if (string.IsNullOrEmpty(diachi))
            {
                MessageBox.Show("Địa chỉ không được để trống");
                txtDiaChi.Select();
                return;
            }
            if (string.IsNullOrEmpty(dienthoai))
            {
                MessageBox.Show("Điện thoại không được để trống");
                txtDienThoai.Select();
                return;
            }
            if (dienthoai.Trim().Length != 10)
            {
                MessageBox.Show("Số điện thoại không hợp lệ. Vui lòng nhập 10 chữ số.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDienThoai.Select();
                return;
            }
            if (string.IsNullOrEmpty(email))
            {
                MessageBox.Show("Email không được để trống");
                txtEmail.Select();
                return;
            }

            List<CustomParameter> lstPara = new List<CustomParameter>();

            if (string.IsNullOrEmpty(msv))
            {
                sql = "insertSinhVien";   
            }
            else
            {
                sql = "updateSinhVien";
                lstPara.Add(new CustomParameter()
                {
                    key = "@masinhvien",
                    value = msv
                });
            }

            lstPara.Add(new CustomParameter()
            {
                key = "@hoten",
                value = hoten
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@ngaysinh",
                value = ngaysinh.ToString("yyyy-MM-dd")
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@gioitinh",
                value = gioitinh
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@quequan",
                value = quequan
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@diachi",
                value = diachi
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@dienthoai",
                value = dienthoai
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@email",
                value = email
            });

            var rs = new Database().ExeCute(sql, lstPara);
            if (rs == 1)
            {
                if (string.IsNullOrEmpty(msv))
                {
                    MessageBox.Show("Thêm thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhật thành công");
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Thực thi thất bại");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
