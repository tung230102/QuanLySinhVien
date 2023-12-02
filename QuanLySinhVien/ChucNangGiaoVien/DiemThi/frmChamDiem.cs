using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.ChucNangGiaoVien.DiemThi
{
    public partial class frmChamDiem : Form
    {
        public frmChamDiem(string magv, string malh)
        {
            this.magv = magv;
            this.malh = malh;
            InitializeComponent();
        }
        private string magv;
        private string malh;
        private void frmChamDiem_Load(object sender, EventArgs e)
        {
            LoadDS();
        }

        private void LoadDS()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@malophoc",
                value = malh
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });
            dgv.DataSource = new Database().SelectData("dssv", lstPara);
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dgv.Rows)
            {
                // Check if there are changes in scores
                if (row.Cells["diemthilan1"].Value != null && row.Cells["diemthilan2"].Value != null)
                {
                    double diemlan1 = Convert.ToDouble(row.Cells["diemthilan1"].Value);
                    double diemlan2 = Convert.ToDouble(row.Cells["diemthilan2"].Value);

                    // Call the chamdiem stored procedure to update the scores in the database
                    List<CustomParameter> lstPara = new List<CustomParameter>();
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@magiaovien",
                        value = magv
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@malop",
                        value = malh
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@masinhvien",
                        value = row.Cells["masinhvien"].Value.ToString()
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@diemlan1",
                        value = diemlan1.ToString() // Convert double to string
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@diemlan2",
                        value = diemlan2.ToString()
                    });

                    string sql = "chamdiem";

                    var rs = new Database().ExeCute(sql, lstPara);
                    
                    if (rs == 1)
                    {
                        MessageBox.Show("Sửa điểm thành công");
                        //this.Dispose();
                    }
                    else
                    {
                        MessageBox.Show("Thực thi thất bại");
                    }
                }
            }
        }

        private void btnKetThucHocPhan_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show(
                    "Bạn chắc chắn muốn đóng lớp học ?",
                    "Xác nhận đóng !!!",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    List<CustomParameter> lstPara = new List<CustomParameter>();
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@magiaovien",
                        value = magv
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@malop",
                        value = malh
                    });

                    string sql = "ketThucHocPhan";
                    var rs = new Database().ExeCute(sql, lstPara);

                    if (rs == 1)
                    {
                        MessageBox.Show("Lớp học đã được đóng thành công", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.Dispose();
                        LoadDS();
                    }
                    else
                    {
                        MessageBox.Show("Thực thi thất bại", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private string tukhoa = "";
        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTuKhoa.Text;
            LoadDS();
        }
    }
}
