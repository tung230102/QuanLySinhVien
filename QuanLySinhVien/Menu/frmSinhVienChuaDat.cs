using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;
using app = Microsoft.Office.Interop.Excel.Application;
namespace QuanLySinhVien.Menu
{
    public partial class frmSinhVienChuaDat : Form
    {
        public frmSinhVienChuaDat()
        {
            InitializeComponent();
        }

        private void frmSinhVienChuaDat_Load(object sender, EventArgs e)
        {
            LoadDS();
        }


        private void LoadDS()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            dgv.DataSource = new Database().SelectData("selectSinhVienMonHocChuaDat", lstPara);
        }
      
        #region method
        public void ExportFile(System.Data.DataTable dataTable, string sheetName, string title)
        {
            Microsoft.Office.Interop.Excel.Application oExcel = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel.Workbooks oBooks;
            Microsoft.Office.Interop.Excel.Sheets oSheets;
            Microsoft.Office.Interop.Excel.Workbook oBook;
            Microsoft.Office.Interop.Excel.Worksheet oSheet;

            // Tao moi mot Excel WorkBook
            oExcel.Visible = true;
            oExcel.DisplayAlerts = false;
            oExcel.Application.SheetsInNewWorkbook = 1;
            oBooks = oExcel.Workbooks;
            oBook = (Microsoft.Office.Interop.Excel.Workbook)(oExcel.Workbooks.Add(Type.Missing));
            oSheets = oBook.Worksheets;
            oSheet = (Microsoft.Office.Interop.Excel.Worksheet)oSheets.get_Item(1);
            oSheet.Name = sheetName;

            // Tao phan tieu de
            Microsoft.Office.Interop.Excel.Range head = oSheet.get_Range("A1", "J1");
            head.MergeCells = true;
            head.Value2 = title;
            head.Font.Bold = true;
            head.Font.Name = "Times New Roman";
            head.Font.Size = "14";
            head.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;

            // Tao tieu de cot
            for (int col = 0; col < dgv.Columns.Count; col++)
            {
                Microsoft.Office.Interop.Excel.Range cl = oSheet.get_Range(GetExcelColumnName(col + 1) + "3", GetExcelColumnName(col + 1) + "3");
                cl.Value2 = dgv.Columns[col].HeaderText;

                if (col == 0 || col == 3 || col == 5 || col == 8 || col == 9)
                    cl.ColumnWidth = 10;
                else if (col == 2)
                {
                    oSheet.Columns[GetExcelColumnName(col + 1)].NumberFormat = "dd/mm/yyyy";
                    cl.ColumnWidth = 10;
                }
                else if (col == 1 || col == 4 || col == 6) 
                    cl.ColumnWidth = 20;
                else
                    cl.ColumnWidth = 30;
            }



            Microsoft.Office.Interop.Excel.Range rowHead = oSheet.get_Range("A3", GetExcelColumnName(dgv.Columns.Count) + "3");
            rowHead.Font.Bold = true;

            // ke vien
            rowHead.Borders.LineStyle = Microsoft.Office.Interop.Excel.Constants.xlSolid;

            // Thiet lap mau nen
            rowHead.Interior.ColorIndex = 6;
            rowHead.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;

            // Tao mang theo database
            /*
            object[,] arr = new object[dataTable.Rows.Count, dataTable.Columns.Count];

            // Chuyen du lieu tu database vao mang doi tuong
            for (int row = 0; row < dataTable.Rows.Count; row++)
            {
                DataRow dataRow = dataTable.Rows[row];

                for (int col = 0; col < dataTable.Columns.Count; col++)
                {
                    arr[row, col] = dataRow[col];
                }
            }
            */

            // Tao mang theo database
            object[,] arr = new object[dataTable.Rows.Count, dataTable.Columns.Count];

            // Chuyen du lieu tu database vao mang doi tuong
            for (int row = 0; row < dataTable.Rows.Count; row++)
            {
                DataRow dataRow = dataTable.Rows[row];

                for (int col = 0; col < dataTable.Columns.Count; col++)
                {
                    if (col == 2)
                    {
                        if (dataRow[col] != DBNull.Value && DateTime.TryParse(dataRow[col].ToString(), out DateTime dateValue))
                        {
                            arr[row, col] = dateValue.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            arr[row, col] = dataRow[col].ToString();
                        }
                    }
                    else
                    {
                        arr[row, col] = dataRow[col];
                    }
                }
            }

            // Thiet lap vung dien du lieu
            int rowStart = 4;
            int columnStart = 1;
            int rowEnd = rowStart + dataTable.Rows.Count - 1;
            int columnEnd = dataTable.Columns.Count;

            // O bat dau dien du lieu
            Microsoft.Office.Interop.Excel.Range c1 = (Microsoft.Office.Interop.Excel.Range)oSheet.Cells[rowStart, columnStart];

            // O ket thuc dien du lieu
            Microsoft.Office.Interop.Excel.Range c2 = (Microsoft.Office.Interop.Excel.Range)oSheet.Cells[rowEnd, columnEnd];

            // Lay ve vung dien du lieu
            Microsoft.Office.Interop.Excel.Range range = oSheet.get_Range(c1, c2);

            // Dien du lieu vao vung da thiet lap
            range.Value2 = arr;

            // Ke vien
            range.Borders.LineStyle = Microsoft.Office.Interop.Excel.Constants.xlSolid;

            // Can giua ca bang
            oSheet.get_Range(c1, c2).HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            System.Data.DataTable dataTable = new System.Data.DataTable();

            foreach (DataGridViewColumn col in dgv.Columns)
            {
                DataColumn dataCol = new DataColumn(col.HeaderText);
                dataTable.Columns.Add(dataCol);
            }

            foreach (DataGridViewRow dtgvRow in dgv.Rows)
            {
                if (dtgvRow != null && !dtgvRow.IsNewRow)
                {
                    DataRow dtrow = dataTable.NewRow();
                    for (int col = 0; col < dataTable.Columns.Count; col++)
                    {
                        dtrow[col] = dtgvRow.Cells[col].Value;
                    }
                    dataTable.Rows.Add(dtrow);
                }
            }

            ExportFile(dataTable, "Danh sach", "Thông tin sinh viên môn học chưa đạt");
        }

        private string GetExcelColumnName(int columnIndex)
        {
            int dividend = columnIndex;
            string columnName = String.Empty;
            int modifier;

            while (dividend > 0)
            {
                modifier = (dividend - 1) % 26;
                columnName = (char)(65 + modifier) + columnName;
                dividend = (dividend - modifier) / 26;
            }

            return columnName;
        }

        #endregion
    }
}
