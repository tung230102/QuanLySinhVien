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
    public partial class frmDangKyMonHoc : Form
    {
        public frmDangKyMonHoc(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }
        private string msv;
        private void frmDangKyMonHoc_Load(object sender, EventArgs e)
        {
            LoadDSLH();
        }

        private void LoadDSLH()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
                {
                    key = "@masinhvien",
                    value = msv
                });
            dgv.DataSource = new Database().SelectData("dsLopChuaDKy", lstPara);
        }

        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

            if (dgv.Rows[e.RowIndex].Index >= 0)
            {
                if (DialogResult.Yes == MessageBox.Show(
                        "Bạn muốn đăng ký học phần [ " + dgv.Rows[e.RowIndex].Cells["tenmonhoc"].Value.ToString()+" ]?",
                        "Bạn xác nhận đang ký", MessageBoxButtons.YesNo, MessageBoxIcon.Question))
                {
                    List<CustomParameter> lstPara = new List<CustomParameter>();
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@masinhvien",
                        value = msv
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@malophoc",
                        value = dgv.Rows[e.RowIndex].Cells["malophoc"].Value.ToString()
                    });

                    var rs = new Database().ExeCute("[dkyhoc]", lstPara);
                    if (rs == -1)
                    {
                        MessageBox.Show("Học phần này bạn đã đăng ký");
                        return;
                    }
                    if (rs == 1)
                    {
                        MessageBox.Show("Đăng ký học phần thành công");
                        LoadDSLH();
                    }
                }
               
                
            }
        }
    }
}
