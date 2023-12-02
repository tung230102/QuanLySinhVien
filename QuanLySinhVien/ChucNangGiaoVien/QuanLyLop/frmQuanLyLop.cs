using QuanLySinhVien.ChucNangGiaoVien.DiemThi;
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

namespace QuanLySinhVien.QuanLyLop
{
    public partial class frmQuanLyLop : Form
    {
        public frmQuanLyLop(string mgv)
        {
            this.mgv = mgv;
            InitializeComponent();
        }
        private string mgv;
        private string tukhoa = "";
        private void frmQuanLyLop_Load(object sender, EventArgs e)
        {
            LoadDSLop();
        }
        private void LoadDSLop()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@magiaovien",
                value = mgv
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });
            dgv.DataSource = new Database().SelectData("traCuuLop", lstPara);
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text; ///
            LoadDSLop();
        }

        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                new frmChamDiem(mgv, dgv.Rows[e.RowIndex].Cells["malophoc"].Value.ToString()).ShowDialog();
                LoadDSLop();
            }
            
        }
    }
}
