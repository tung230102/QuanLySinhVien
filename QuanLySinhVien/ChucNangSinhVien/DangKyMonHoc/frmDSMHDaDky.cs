using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.DangKyMonHoc
{
    public partial class frmDSMHDaDky : Form
    {
        private string msv;
        public frmDSMHDaDky(string msv)
        {
            InitializeComponent();
            this.msv = msv;
        }

        private void frmDSMHDaDky_Load(object sender, EventArgs e)
        {
            LoadDS();
        }

        private void LoadDS()
        {
            List<CustomParameter> lst = new List<CustomParameter>()
            {
                new CustomParameter()
                {
                    key = "@masinhvien",
                    value = msv
                }
            };
            dgvDSMHDKy.DataSource = new Database().SelectData("monDaDKy", lst);
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            new frmDangKyMonHoc(msv).ShowDialog();
            LoadDS();
        }
    }
}
