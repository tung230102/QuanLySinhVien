namespace QuanLySinhVien.DangKyMonHoc
{
    partial class frmDSMHDaDky
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvDSMHDKy = new System.Windows.Forms.DataGridView();
            this.malophoc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tenmonhoc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.hoten = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sotinchi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.diemthilan1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.diemthilan2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnTimKiem = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSMHDKy)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvDSMHDKy
            // 
            this.dgvDSMHDKy.AllowUserToAddRows = false;
            this.dgvDSMHDKy.AllowUserToDeleteRows = false;
            this.dgvDSMHDKy.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvDSMHDKy.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDSMHDKy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDSMHDKy.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.malophoc,
            this.tenmonhoc,
            this.hoten,
            this.sotinchi,
            this.diemthilan1,
            this.diemthilan2});
            this.dgvDSMHDKy.Location = new System.Drawing.Point(12, 70);
            this.dgvDSMHDKy.MultiSelect = false;
            this.dgvDSMHDKy.Name = "dgvDSMHDKy";
            this.dgvDSMHDKy.ReadOnly = true;
            this.dgvDSMHDKy.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDSMHDKy.Size = new System.Drawing.Size(860, 380);
            this.dgvDSMHDKy.TabIndex = 27;
            // 
            // malophoc
            // 
            this.malophoc.DataPropertyName = "malophoc";
            this.malophoc.HeaderText = "Mã lớp học";
            this.malophoc.Name = "malophoc";
            this.malophoc.ReadOnly = true;
            // 
            // tenmonhoc
            // 
            this.tenmonhoc.DataPropertyName = "tenmonhoc";
            this.tenmonhoc.HeaderText = "Tên môn học";
            this.tenmonhoc.Name = "tenmonhoc";
            this.tenmonhoc.ReadOnly = true;
            // 
            // hoten
            // 
            this.hoten.DataPropertyName = "hoten";
            this.hoten.HeaderText = "Giáo viên";
            this.hoten.Name = "hoten";
            this.hoten.ReadOnly = true;
            // 
            // sotinchi
            // 
            this.sotinchi.DataPropertyName = "sotinchi";
            this.sotinchi.HeaderText = "Số tín chỉ";
            this.sotinchi.Name = "sotinchi";
            this.sotinchi.ReadOnly = true;
            // 
            // diemthilan1
            // 
            this.diemthilan1.DataPropertyName = "diemthilan1";
            this.diemthilan1.HeaderText = "Điểm thi lần 1";
            this.diemthilan1.Name = "diemthilan1";
            this.diemthilan1.ReadOnly = true;
            // 
            // diemthilan2
            // 
            this.diemthilan2.DataPropertyName = "diemthilan2";
            this.diemthilan2.HeaderText = "Điểm thi lần 2";
            this.diemthilan2.Name = "diemthilan2";
            this.diemthilan2.ReadOnly = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnTimKiem);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(884, 60);
            this.panel1.TabIndex = 35;
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTimKiem.BackColor = System.Drawing.SystemColors.Window;
            this.btnTimKiem.FlatAppearance.BorderSize = 0;
            this.btnTimKiem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTimKiem.Image = global::QuanLySinhVien.Properties.Resources.icons8_add_16;
            this.btnTimKiem.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnTimKiem.Location = new System.Drawing.Point(750, 20);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(0);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(90, 28);
            this.btnTimKiem.TabIndex = 12;
            this.btnTimKiem.Text = "     Đăng ký";
            this.btnTimKiem.UseVisualStyleBackColor = false;
            this.btnTimKiem.Click += new System.EventHandler(this.btnThemMoi_Click);
            // 
            // frmDSMHDaDky
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 461);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.dgvDSMHDKy);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmDSMHDaDky";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh sách môn học đã đăng ký";
            this.Load += new System.EventHandler(this.frmDSMHDaDky_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSMHDKy)).EndInit();
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDSMHDKy;
        private System.Windows.Forms.DataGridViewTextBoxColumn malophoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn tenmonhoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn hoten;
        private System.Windows.Forms.DataGridViewTextBoxColumn sotinchi;
        private System.Windows.Forms.DataGridViewTextBoxColumn diemthilan1;
        private System.Windows.Forms.DataGridViewTextBoxColumn diemthilan2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnTimKiem;
    }
}