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
    public partial class frmDSGiangVien : Form
    {
        public frmDSGiangVien()
        {
            InitializeComponent();
        }
        private string tukhoa = "";
        private void frmDSGV_Load(object sender, EventArgs e)
        {
            LoadDSGV();
        }
        private void LoadDSGV()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = tukhoa
            });
            dgvDSGV.DataSource = new Database().SelectData("selectAllGiaoVien", lstPara);
        }

        private void dgvDSGV_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var mgv = dgvDSGV.Rows[e.RowIndex].Cells["magiaovien"].Value.ToString();
                //
                new frmGiangVien(mgv).ShowDialog();

                LoadDSGV();
            }
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmGiangVien(null).ShowDialog();
            LoadDSGV();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text;
            LoadDSGV();
        }

        private void dgvDSGV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (e.ColumnIndex == dgvDSGV.Columns["btnXoa"].Index)
                {
                    if (MessageBox.Show(
                        "Bạn chắc chắn muốn xóa giáo viên: " + dgvDSGV.Rows[e.RowIndex].Cells["hoten"].Value.ToString()+ " ?", 
                        "Xác nhận xóa !!!", 
                        MessageBoxButtons.YesNo,
                        MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        var mgv = dgvDSGV.Rows[e.RowIndex].Cells["magiaovien"].Value.ToString();

                        var lstPara = new List<CustomParameter>()
                    {
                        new CustomParameter
                        {
                            key = "@magiaovien",
                            value = mgv
                        }
                    };
                        new Database().ExeCute("deleteGiaoVien", lstPara);

                        MessageBox.Show("Xóa thành công");
                        LoadDSGV();
                    }
                }
            }
        }
    }
}
