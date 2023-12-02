using QuanLySinhVien.DangKyMonHoc;
using QuanLySinhVien.DangNhap;
using QuanLySinhVien.Menu;
using QuanLySinhVien.QuanLyLop;
using RJCodeAdvance.RJControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien
{
    public partial class frmMain : Form
    {
        private int borderSize = 0;
        public frmMain()
        {
            InitializeComponent();
            CollapseMenu();
            this.Padding = new Padding(borderSize);
            this.BackColor = Color.FromArgb(41, 128, 185);
        }

        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);


        private void panelTitleBar_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        protected override void WndProc(ref Message m)
        {
            const int WM_NCCALCSIZE = 0x0083;

            if (m.Msg == WM_NCCALCSIZE && m.WParam.ToInt32() == 1)
            {
                return;
            }
            base.WndProc(ref m);
        }

        private void frmMenu_Resize(object sender, EventArgs e)
        {
            AdjusrForm();
        }

        private void AdjusrForm()
        {
            switch (this.WindowState)
            {
                case FormWindowState.Minimized:
                    this.Padding = new Padding(8, 8, 8, 0);
                    break;
                case FormWindowState.Normal:
                    if (this.Padding.Top != borderSize)
                        this.Padding = new Padding(borderSize);
                    break;
                case FormWindowState.Maximized:
                    this.Padding = new Padding(8, 8, 8, 0);
                    break;
            }
        }

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btnMaxmize_Click(object sender, EventArgs e)
        {
            if ( this.WindowState == FormWindowState.Normal)
                this.WindowState = FormWindowState.Maximized;
            else
                this.WindowState = FormWindowState.Normal;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMenu_Click(object sender, EventArgs e)
        {
            CollapseMenu();
        }

        private void CollapseMenu()
        {
            if (this.panelMenu.Width >= 200)
            {
                panelMenu.Width = 100;
                pictureBox1.Visible = false;
                btnMenu.Dock = DockStyle.Top;
                foreach (Button menuButton in panelMenu.Controls.OfType<Button>())
                {
                    menuButton.Text = "";
                    menuButton.ImageAlign = ContentAlignment.MiddleCenter;
                    menuButton.Padding = new Padding();
                }
            }
            else
            {
                panelMenu.Width = 200;
                pictureBox1.Visible = true;
                btnMenu.Dock = DockStyle.None;
                foreach (Button menuButton in panelMenu.Controls.OfType<Button>())
                {
                    menuButton.Text = "     " + menuButton.Tag.ToString();
                    menuButton.ImageAlign = ContentAlignment.MiddleLeft;
                    menuButton.Padding = new Padding(10, 0 , 0, 0);
                }
            }
        }

        private void Open_DropdownMenu(RJDropdownMenu dropdownMenu, object sender)
        {
            Control control = (Control)sender;
            dropdownMenu.VisibleChanged += new EventHandler((sender2, ev)
                => DropdownMenu_VisibleChanged(sender2, ev, control));
            dropdownMenu.Show(control, control.Width, 0);
        }

        private void DropdownMenu_VisibleChanged(object sender, EventArgs e, Control ctrl)
        {
            RJDropdownMenu dropdownMenu = (RJDropdownMenu)sender;
            if (!DesignMode)
            {
                if (dropdownMenu.Visible)
                    ctrl.BackColor = Color.FromArgb(41, 128, 185);
                else ctrl.BackColor = Color.FromArgb(41, 128, 185);
            }
        }

        private void btnQuanLy_Click(object sender, EventArgs e)
        {
            Open_DropdownMenu(rjDropdownMenu1, sender);
        }

        private void btnControlSinhVien_Click(object sender, EventArgs e)
        {
            Open_DropdownMenu(rjDropdownMenu2, sender);
        }

        private string taikhoan;
        private string loaitk;
        private void frmMenu_Load(object sender, EventArgs e)
        {
            LoadDangNhap();
        }

        private void LoadDangNhap()
        {
            var fn = new frmDangNhap(this);
            fn.ShowDialog();

            taikhoan = fn.tendangnhap;
            loaitk = fn.loaitk;

            if (loaitk != null)
            {
                if (loaitk.Equals("admin"))
                {
                    btnControlSinhVien.Visible = false;
                    btnControlClass.Visible = false;
                    btnQuanLy.Visible = true;
                    lbTitle.Text = "Xin chào, " + taikhoan;
                }
                else
                {
                    btnQuanLy.Visible = false;
                    if (loaitk.Equals("gv"))
                    {
                        btnControlSinhVien.Visible = false;
                        btnControlClass.Visible = true;
                        lbTitle.Text = "Xin chào, tài khoản giáo viên - " + taikhoan;
                    }
                    else
                    {
                        btnControlClass.Visible = false;
                        btnControlSinhVien.Visible = true;
                        lbTitle.Text = "Xin chào, tài khoản sinh viên - " + taikhoan;
                    }
                }

                frmWelcome f = new frmWelcome();
                AddForm(f);
            }
        }

        public void ExitApp()
        {
            Application.Exit();
        }

        // dropdown
        private void AddForm(Form f)
        {
            this.panelConent.Controls.Clear();
            f.TopLevel = false;
            f.AutoScroll = true;
            f.FormBorderStyle = FormBorderStyle.None;
            f.Dock = DockStyle.Fill;
            this.panelConent.Controls.Add(f);
            this.Text = f.Text;
            f.Show();
        }

        private void sinhVienToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDSSinhVien f = new frmDSSinhVien();
            AddForm(f);
            lbTitle.Text = "Quản lý sinh viên";
        }

        private void monHocToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDSMonHoc f = new frmDSMonHoc();
            AddForm(f);
            lbTitle.Text = "Quản lý môn học";
        }

        private void giaoVienToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDSGiangVien f = new frmDSGiangVien();
            AddForm(f);
            lbTitle.Text = "Quản lý giảng viên";
        }

        private void lopHocToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDSLopHoc f = new frmDSLopHoc();
            AddForm(f);
            lbTitle.Text = "Quản lý lớp học";
        }

        private void dangKyMonHocToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDSMHDaDky f = new frmDSMHDaDky(taikhoan);
            AddForm(f);
            lbTitle.Text = "Đăng ký môn học";
        }

        private void traCuuDiemToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var f = new frmKetQuaHocTap(taikhoan);
            AddForm(f);
            lbTitle.Text = "Tra cứu điểm";
        }

        // sidebar
        private void btnHome_Click(object sender, EventArgs e)
        {
            var f = new frmWelcome();
            AddForm(f);
            if (loaitk.Equals("admin"))
            {
                lbTitle.Text = "Xin chào, " + taikhoan;
            }
            else
            {
                if (loaitk.Equals("gv"))
                {  
                    lbTitle.Text = "Xin chào, tài khoản giáo viên - " + taikhoan;
                }
                else
                {
                    lbTitle.Text = "Xin chào, tài khoản sinh viên - " + taikhoan;
                }
            }
        }

        private void btnControlClass_Click(object sender, EventArgs e)
        {
            var f = new frmQuanLyLop(taikhoan);
            AddForm(f);
            lbTitle.Text = "Quản lý sinh viên trong lớp học";
        }
        private void btnDoiMatKhau_Click(object sender, EventArgs e)
        {
            new frmDoiMatKhau(taikhoan, loaitk).ShowDialog();
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoadDangNhap();
            this.Show();
        }

        private void sinhVienGioiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmBaoCao f = new frmBaoCao();
            AddForm(f);
            lbTitle.Text = "Danh sách sinh viên đạt học bổng";
        }

        private void btnBaoCao_Click(object sender, EventArgs e)
        {
            Open_DropdownMenu(rjDropdownMenu3, sender);
        }

        private void sinhVienChuaDatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSinhVienChuaDat f = new frmSinhVienChuaDat();
            AddForm(f);
            lbTitle.Text = "Thông tin sinh viên có môn học chưa đạt";
        }
    }
}
