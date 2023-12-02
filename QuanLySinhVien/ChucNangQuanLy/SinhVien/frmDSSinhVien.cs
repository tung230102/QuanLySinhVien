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
    public partial class frmDSSinhVien : Form
    {
        public frmDSSinhVien()
        {
            InitializeComponent();
        }
        private string tukhoa = "";
        private void frmDSSV_Load(object sender, EventArgs e)
        {
            LoadDSSV();
        }

        private void LoadDSSV()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = tukhoa
            });
            dgvDSSV.DataSource = new Database().SelectData("selectAllSinhVien", lstPara);


        }

        private void dgvSinhVien_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex>=0)
            {
                var msv = dgvDSSV.Rows[e.RowIndex].Cells["masinhvien"].Value.ToString();
                //
                new frmSinhVien(msv).ShowDialog();

                LoadDSSV();
            }
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmSinhVien(null).ShowDialog();
            LoadDSSV();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text;
            LoadDSSV();
        }

        private void dgvDSSV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (e.ColumnIndex == dgvDSSV.Columns["btnXoa"].Index)
                {
                    if (MessageBox.Show(
                        "Bạn chắc chắn muốn xóa sinh viên có mã: " + dgvDSSV.Rows[e.RowIndex].Cells["hoten"].Value.ToString() + " ?",
                        "Xác nhận xóa !!!",
                        MessageBoxButtons.YesNo,
                        MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        var msv = dgvDSSV.Rows[e.RowIndex].Cells["masinhvien"].Value.ToString();

                        var lstPara = new List<CustomParameter>()
                    {
                        new CustomParameter
                        {
                            key = "@masinhvien",
                            value = msv
                        }
                    };
                        new Database().ExeCute("deleteSinhVien", lstPara);

                        MessageBox.Show("Xóa thành công");
                        LoadDSSV();
                    }
                    else
                    {
                        MessageBox.Show("Xóa không thành công");
                    }

                }
            }
        }
    }
}
