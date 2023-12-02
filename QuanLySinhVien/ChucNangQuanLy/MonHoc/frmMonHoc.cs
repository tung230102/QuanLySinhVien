using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien
{
    public partial class frmMonHoc : Form
    {
        public frmMonHoc(string mamh)
        {
            this.mamh = mamh;
            InitializeComponent();
        }
        private string mamh;
        private string nguoithucthi = "admin";
        private void frmMonHoc_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(mamh))
            {
                this.Text = "Thêm mới môn học";
            }
            else
            {
                this.Text = "Cập nhật môn học";
                var r = new Database().Select(string.Format("selectMonHoc '" + mamh + "' "));
                txtTenMonHoc.Text = r["tenmonhoc"].ToString();
                txtSoTC.Text = r["sotinchi"].ToString();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTenMonHoc.Text))
            {
                MessageBox.Show("Tên môn học không được để trống");
                txtTenMonHoc.Select();
                return;
            }
            try
            {
                var stc = int.Parse(txtSoTC.Text);
                if (stc <= 0)
                {
                    MessageBox.Show("Số tín chỉ phải lớn hơn 0");
                    txtSoTC.Select();
                    return;
                }
            }
            catch
            {
                MessageBox.Show("Số tín chỉ phải là kiểu số nguyên");
                txtSoTC.Select();
                return;
            }

            string sql = "";
            List<CustomParameter> lstPara = new List<CustomParameter>();

            if (string.IsNullOrEmpty(mamh))
            {
                sql = "insertMonHoc";
                lstPara.Add(new CustomParameter()
                {
                    key = "@nguoitao",
                    value = nguoithucthi
                });
            }
            else
            {
                sql = "updateMonHoc";
                lstPara.Add(new CustomParameter()
                {
                    key = "@nguoicapnhat",
                    value = nguoithucthi
                });
                lstPara.Add(new CustomParameter()
                {
                    key = "@mamonhoc",
                    value = mamh
                });
            }

            lstPara.Add(new CustomParameter()
            {
                key = "@tenmonhoc",
                value = txtTenMonHoc.Text
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@sotinchi",
                value = txtSoTC.Text
            });

            var rs = new Database().ExeCute(sql , lstPara);

            if (rs == 1)
            {
                if (string.IsNullOrEmpty(mamh))
                {
                    MessageBox.Show("Thêm mới môn học thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhật thông tin môn học thành công");
                }
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
