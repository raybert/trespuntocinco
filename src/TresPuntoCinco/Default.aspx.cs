using System;

namespace TresPuntoCinco
{
	public partial class _Default : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (!Page.IsPostBack)
			//{
			//    LoadMonths();
			//    LoadYears();
			//    LoadCalendar();
			//}

		//    protected void LoadMonths()
		//    {
		//        for ( i = 1; i < 12; i++)
		//        {
		//            var li = new ListItem();
		//            li.Text = MonthName(i);
		//            // MonthName() gets the month name based on the users computer settings (their local month name rather than English default) '

		//            li.Value = i.ToString();
		//            ddl_month.Items.Add(li)
		//            if (li.Value == DateTime.Now.Month.ToString)
		//                li.Selected = true;

		//        }
		//}

	//        Protected Sub LoadYears()
	//    Dim yearsBack As Integer = 3
	//    Dim yearsForward As Integer = 3
	//    For i As Integer = DateTime.Now.AddYears(-yearsBack).Year To DateTime.Now.AddYears(yearsForward).Year
	//        Dim li As New ListItem
	//        li.Text = i.ToString
	//        li.Value = i.ToString
	//        ddl_year.Items.Add(li)
	//        If li.Value = DateTime.Now.Year Then
	//            li.Selected = True
	//        End If
	//    Next
	//End Sub
		}
	}
}

