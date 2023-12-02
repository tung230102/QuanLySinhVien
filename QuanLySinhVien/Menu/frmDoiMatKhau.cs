using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.Menu
{
    public partial class frmDoiMatKhau : Form
    {
        public frmDoiMatKhau(string taikhoan, string loaitk)
        {
            InitializeComponent();
            this.taikhoan = taikhoan;
            this.loaitk = loaitk;
        }
        private string taikhoan;
        private string loaitk;
        private void frmDoiMatKhau_Load(object sender, EventArgs e)
        {
            try
            {
                List<CustomParameter> lstPara = new List<CustomParameter>();
                lstPara.Add(new CustomParameter()
                {
                    key = "@taikhoan",
                    value = taikhoan
                });

                lstPara.Add(new CustomParameter()
                {
                    key = "@loaitaikhoan",
                    value = loaitk
                });

                var r = new Database().SelectData("selectTaiKhoan", lstPara);

                if (r != null && r.Rows.Count > 0)
                {
                    DataRow row = r.Rows[0];

                    if (loaitk == "admin")
                    {
                        txtTaiKhoan.Text = row["tentaikhoan"].ToString();
                    }
                    else if (loaitk == "gv")
                    {
                        txtTaiKhoan.Text = row["magiaovien"].ToString();
                    }
                    else
                    {
                        txtTaiKhoan.Text = row["masinhvien"].ToString();
                    }
                        txtMatKhau.Text = row["matkhau"].ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải dữ liệu: " + ex.Message);
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@taikhoan",
                value = taikhoan
            });

            lstPara.Add(new CustomParameter()
            {
                key = "@loaitaikhoan",
                value = loaitk
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@matkhau",
                value = txtMatKhau.Text
            });

            var rs = new Database().ExeCute("doiMatKhau", lstPara);

            if (rs == 1)
            {
                MessageBox.Show("Cập nhật thông tin tài khoản thành công");
            }
            else
            {
                MessageBox.Show("Thực hiên truy vấn thất bại");
            }
            this.Dispose();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
