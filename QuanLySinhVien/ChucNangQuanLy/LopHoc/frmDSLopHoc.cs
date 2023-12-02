using QuanLySinhVien.LopHoc;
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
    public partial class frmDSLopHoc : Form
    {
        public frmDSLopHoc()
        {
            InitializeComponent();
        }
        private string tukhoa = "";
        private void frmDSLopHoc_Load(object sender, EventArgs e)
        {
            LoadDSLH();
        }

        private void LoadDSLH()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = tukhoa
            });
            dgvLopHoc.DataSource = new Database().SelectData("selectAllLopHoc", lstPara);
           
        }

        private void dgvLopHoc_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                new frmLopHoc(dgvLopHoc.Rows[e.RowIndex].Cells["malophoc"].Value.ToString()).ShowDialog();
                LoadDSLH();
            }
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmLopHoc(null).ShowDialog();
            LoadDSLH();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text;
            LoadDSLH();
        }

        private void dgvLopHoc_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (e.ColumnIndex == dgvLopHoc.Columns["btnXoa"].Index)
                {
                    if (MessageBox.Show(
                        "Bạn chắc chắn muốn xóa lớp học: " + dgvLopHoc.Rows[e.RowIndex].Cells["malophoc"].Value.ToString() +
                        " - môn học: "+ dgvLopHoc.Rows[e.RowIndex].Cells["tenmonhoc"].Value.ToString() + "" +
                        " - giáo viên: " + dgvLopHoc.Rows[e.RowIndex].Cells["hoten"].Value.ToString() + "" +
                        "?",
                        "Xác nhận xóa !!!",
                        MessageBoxButtons.YesNo,
                        MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        var mgv = dgvLopHoc.Rows[e.RowIndex].Cells["malophoc"].Value.ToString();

                        var lstPara = new List<CustomParameter>()
                    {
                        new CustomParameter
                        {
                            key = "@malophoc",
                            value = mgv
                        }
                    };
                        new Database().ExeCute("deleteLopHoc", lstPara);

                        MessageBox.Show("Xóa thành công");
                        LoadDSLH();
                    }
                }
            }
        }
    }
}
