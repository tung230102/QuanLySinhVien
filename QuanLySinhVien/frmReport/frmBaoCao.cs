using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySinhVien.Menu
{
    public partial class frmBaoCao : Form
    {
        public frmBaoCao()
        {
            InitializeComponent();
        }

        private void frmBaoCao_Load(object sender, EventArgs e)
        {
            this.rpvBaoCao.RefreshReport();
            LoadReport();
        }

        private void LoadReport()
        {
            SqlConnection conn = Database.Connect();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "selectSVHocBong";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;

            // Create a dataset to store data
            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            dap.Fill(ds);

            // Set up the ReportViewer control
            rpvBaoCao.ProcessingMode = ProcessingMode.Local;
            rpvBaoCao.LocalReport.ReportPath = "/QuanLySinhVien/QuanLySinhVien/rdlcReport/rptBaoCao.rdlc";

            // Create a ReportDataSource and assign the dataset to it
            ReportDataSource rds = new ReportDataSource();
            rds.Name = "dsSinhVienHocBong";
            rds.Value = ds.Tables[0];

            // Clear existing data sources and add the new one
            rpvBaoCao.LocalReport.DataSources.Clear();
            rpvBaoCao.LocalReport.DataSources.Add(rds);

            // Refresh the report
            rpvBaoCao.RefreshReport();
        }

    }
}
