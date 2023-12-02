using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.LopHoc
{
    public partial class frmLopHoc : Form
    {
        public frmLopHoc(string malh)
        {
            this.malh = malh;
            InitializeComponent();
        }
        private string malh;
        private Database db;
        private string nguoithuchien = "admin";
        private void frmLopHoc_Load(object sender, EventArgs e)
        {
            db = new Database();
            List<CustomParameter> lstPara = new List<CustomParameter>();

            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = ""
            });

            //combobox
            cbbMonHoc.DataSource = db.SelectData("selectAllMonHoc", lstPara);
            cbbMonHoc.DisplayMember = "tenmonhoc";
            cbbMonHoc.ValueMember = "mamonhoc";
            cbbMonHoc.SelectedIndex = -1;

            cbbGiaoVien.DataSource = db.SelectData("selectAllGiaoVien", lstPara);
            cbbGiaoVien.DisplayMember = "hoten";
            cbbGiaoVien.ValueMember = "magiaovien";
            cbbGiaoVien.SelectedIndex = -1;

            if (string.IsNullOrEmpty(malh))
            {
                this.Text = "Thêm mới lớp học";
            }
            else
            {
                this.Text = "Cập nhật lớp học";
                var r = db.Select("selectLopHoc '" + malh+ "' ");
                cbbMonHoc.SelectedValue = r["mamonhoc"].ToString();
                cbbGiaoVien.SelectedValue = r["magiaovien"].ToString();
            }

        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            if (cbbMonHoc.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn môn học");
                return;
            }
            if (cbbGiaoVien.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn giáo viên");
                return;
            }

            List<CustomParameter> lstPara = new List<CustomParameter>();
            if (string.IsNullOrEmpty(malh))
            {
                sql = "insertLopHoc";
                lstPara.Add(new CustomParameter()
                {
                    key = "@nguoitao",
                    value = nguoithuchien
                });
            }
            else
            {
                sql = "updateLopHoc";
                lstPara.Add(new CustomParameter()
                {
                    key = "@nguoicapnhat",
                    value = nguoithuchien
                });
                lstPara.Add(new CustomParameter()
                {
                    key = "@malophoc",
                    value = malh
                });
            }

            lstPara.Add(new CustomParameter()
            {
                key = "@mamonhoc",
                value = cbbMonHoc.SelectedValue.ToString()
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@magiaovien",
                value = cbbGiaoVien.SelectedValue.ToString()
            });

            var kq = db.ExeCute(sql, lstPara);
            if (kq == 1)
            {
                if (string.IsNullOrEmpty(malh))
                {
                    MessageBox.Show("Thêm mới lớp học thành công");
                }
                else
                {
                    MessageBox.Show("Cập nhật lớp học thành công");
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Lưu dữ liệu thất bại");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }


    }
}
