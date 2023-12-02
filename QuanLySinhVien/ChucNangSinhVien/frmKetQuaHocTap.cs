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
    public partial class frmKetQuaHocTap : Form
    {
        public frmKetQuaHocTap(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }
        private string msv;
        private void frmKetQuaHocTap_Load(object sender, EventArgs e)
        {
            LoadKQHT();
        }

        private void LoadKQHT()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@masinhvien",
                value = msv
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });
            dgv.DataSource = new Database().SelectData("traCuuDiem", lstPara);
        }
        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            LoadKQHT();
        }
    }
}
