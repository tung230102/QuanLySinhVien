namespace QuanLySinhVien
{
    partial class frmDangKyMonHoc
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
            this.dgv = new System.Windows.Forms.DataGridView();
            this.malophoc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.mamonhoc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tenmonhoc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sotinchi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.hoten = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.malophoc,
            this.mamonhoc,
            this.tenmonhoc,
            this.sotinchi,
            this.hoten});
            this.dgv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgv.Location = new System.Drawing.Point(0, 0);
            this.dgv.MultiSelect = false;
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv.Size = new System.Drawing.Size(884, 461);
            this.dgv.TabIndex = 0;
            this.dgv.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_CellDoubleClick);
            // 
            // malophoc
            // 
            this.malophoc.DataPropertyName = "malophoc";
            this.malophoc.HeaderText = "Mã lớp học";
            this.malophoc.Name = "malophoc";
            this.malophoc.ReadOnly = true;
            // 
            // mamonhoc
            // 
            this.mamonhoc.DataPropertyName = "mamonhoc";
            this.mamonhoc.HeaderText = "Mã môn học";
            this.mamonhoc.Name = "mamonhoc";
            this.mamonhoc.ReadOnly = true;
            // 
            // tenmonhoc
            // 
            this.tenmonhoc.DataPropertyName = "tenmonhoc";
            this.tenmonhoc.HeaderText = "Tên môn học";
            this.tenmonhoc.Name = "tenmonhoc";
            this.tenmonhoc.ReadOnly = true;
            // 
            // sotinchi
            // 
            this.sotinchi.DataPropertyName = "sotinchi";
            this.sotinchi.HeaderText = "Số tín chỉ";
            this.sotinchi.Name = "sotinchi";
            this.sotinchi.ReadOnly = true;
            // 
            // hoten
            // 
            this.hoten.DataPropertyName = "hoten";
            this.hoten.HeaderText = "Giáo viên";
            this.hoten.Name = "hoten";
            this.hoten.ReadOnly = true;
            // 
            // frmDangKyMonHoc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 461);
            this.Controls.Add(this.dgv);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmDangKyMonHoc";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng ký môn học";
            this.Load += new System.EventHandler(this.frmDangKyMonHoc_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn malophoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn mamonhoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn tenmonhoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn sotinchi;
        private System.Windows.Forms.DataGridViewTextBoxColumn hoten;
    }
}