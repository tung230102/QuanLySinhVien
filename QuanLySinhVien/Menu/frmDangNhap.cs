using QuanLySinhVien.DangKyMonHoc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.DangNhap
{
    public partial class frmDangNhap : Form
    {
        private frmMain frmMain;
        public frmDangNhap(frmMain frmMain)
        {
            InitializeComponent();
            this.frmMain = frmMain;
        }
        public string tendangnhap = "";
        public string loaitk;
        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            #region ktr_rangbuoc
            if (string.IsNullOrEmpty(txtTenDN.Text))
            {
                MessageBox.Show("Vui lòng nhập tên tài khoản", "Tài khoản không được để trống");
                txtTenDN.Select();
                return;
            }
            if (string.IsNullOrEmpty(txtMatKhau.Text))
            {
                MessageBox.Show("Vui lòng nhập mật khẩu", "Mật khẩu không được để trống");
                txtMatKhau.Select();
                return;
            }
            if (cbbLoaiTK.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn loại tài khoản");
                return;
            }
            #endregion
            tendangnhap = txtTenDN.Text;
            loaitk = "";

            #region
            switch (cbbLoaiTK.Text)
            {
                case "Quản trị viên":
                    loaitk = "admin";
                    break;
                case "Giáo viên":
                    loaitk = "gv";
                    break;
                case "Sinh viên":
                    loaitk = "sv";
                    break;
            }
            #endregion

            List<CustomParameter> lst = new List<CustomParameter>()
            {
                new CustomParameter()
                {
                    key = "@loaitaikhoan",
                    value = loaitk
                },
                new CustomParameter()
                {
                    key = "@taikhoan",
                    value = txtTenDN.Text
                },
                new CustomParameter()
                {
                    key = "@matkhau",
                    value = txtMatKhau.Text
                }
            };

            var rs = new Database().SelectData("dangnhap", lst);
            if (rs.Rows.Count > 0)
            {
                this.Hide();
                this.Close();
            }
            else
            {
                MessageBox.Show("Vui lòng kiểm tra lại tên đang nhập hoặc mật khẩu", "Tài khoản hoặc mật khẩu không đúng");
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            frmMain.ExitApp();
            this.Close();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            frmMain.ExitApp();
            this.Close();
        }
    }
}
