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
    public partial class frmDSMonHoc : Form
    {
        public frmDSMonHoc()
        {
            InitializeComponent();
        }
        private string tukhoa = "";
        private void frmDSMH_Load(object sender, EventArgs e)
        {
            LoadDSMH();
        }
        private void LoadDSMH()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = tukhoa
            });
            dgvDSMH.DataSource = new Database().SelectData("selectAllMonHoc", lstPara);
        }

        private void dgvDSMH_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var mamh = dgvDSMH.Rows[e.RowIndex].Cells["mamonhoc"].Value.ToString();
                new frmMonHoc(mamh).ShowDialog();
                LoadDSMH();
            }
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmMonHoc(null).ShowDialog();
            LoadDSMH();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text;
            LoadDSMH();
        }

        private void dgvDSMH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (e.ColumnIndex == dgvDSMH.Columns["btnXoa"].Index)
                {
                    if (MessageBox.Show(
                        "Bạn chắc chắn muốn xóa môn học: " + dgvDSMH.Rows[e.RowIndex].Cells["tenmonhoc"].Value.ToString() + " ?",
                        "Xác nhận xóa !!!",
                        MessageBoxButtons.YesNo,
                        MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        var mamh = dgvDSMH.Rows[e.RowIndex].Cells["mamonhoc"].Value.ToString();

                        var lstPara = new List<CustomParameter>()
                    {
                        new CustomParameter
                        {
                            key = "@mamonhoc",
                            value = mamh
                        }
                    };
                        new Database().ExeCute("deleteMonHoc", lstPara);

                        MessageBox.Show("Xóa thành công");
                        LoadDSMH();
                    }
                }
            }
        }
    }
}
