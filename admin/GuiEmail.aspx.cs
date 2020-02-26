using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

public partial class admin_GuiEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NV"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string q = manguoidung();
            // Label1.Text = q;
            if (q.Equals("2"))
            {
                Label1.Text = "Xin chào, Thu Ngân";
            }
            else Label1.Text = "Xin chào, Admin";
        }
        if (DetailsView1.Rows.Count == 3)
            to.Text = DetailsView1.Rows[2].Cells[1].Text;

        else
            Response.Write("<script>alert('Email khách hàng chưa được cung cấp')</script>");

        body.Text = "Chào Quý Khách!\r\nLời đầu tiên, Nhà hàng Hatoyama xin gửi lời cám ơn chân thành và sâu sắc nhất đến Quý khách hàng đã tin tưởng hợp tác và sử dụng dịch vụ của chúng tôi. Sự tin tưởng của quý vị đã góp phần lớn quyết định sự phát triển và thành công của khách sạn trong thời gian qua.Với phương châm “Sự hài lòng của khách hàng là tôn chỉ nam của mọi hoạt động”, trong những năm qua, Nhà hàng chúng tôi đã và đang không ngừng phấn đấu, nâng cao chất lượng dịch vụ để mang lại nhiều lợi ích hơn và có thể đáp ứng mọi yêu cầu của khách hàng.Chúng tôi luôn biết rằng, sự ủng hộ và sự tin yêu của Quý khách hàng là tài sản vô giá với Khách sạn chúng tôi, để đạt được điều này chúng tôi luôn nỗ lực không ngừng, hướng tới mục tiêu phát triển bền vững, chú trọng xây dựng các chính sách chăm sóc khách hàng,mang lại những giá trị thiết thực để luôn làm hài lòng khách hàng ở mức cao nhất nhằm đáp lại tình cảm và sự tin yêu của Quý khách.\r\nMột lần nữa, Nhà hàng chúng tôi xin được gửi lời cảm ơn chân thành đến Quý khách hàng đã không ngừng quan tâm và luôn đồng hành cùng Khách sạn....... trong suốt thời gian qua. Chúng tôi cũng hy vọng trong thời gian tới sẽ tiếp tục nhận được sự quan tâm và tín nhiệm của Quý khách.Xin chúc quý khách hàng sức khỏe, may mắn và thành công.\r\nTrân Trọng!";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (to.Text.Equals(""))
            status.Text = "Không có địa chỉ email người nhận!";
        else
        {
            try
            {
                MailMessage message1 = new MailMessage(from.Text, to.Text, subject.Text, body.Text);
                message1.IsBodyHtml = true;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("nhahanghatoyamavn@gmail.com", "hatoyama");
                client.Send(message1);
                status.Text = "Gửi thư thành công!";
            }
            catch (Exception ex)
            {

                status.Text = ex.StackTrace;
            }
        }
    }
    public string manguoidung()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["NV"];
        //truy vấn data:
        string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string select = "SELECT quyen FROM NHAN_VIEN WHERE manv=@tk AND matkhau=@mk";
        SqlCommand comand = new SqlCommand(select, con);
        comand.Parameters.AddWithValue("tk", tk.userName);
        comand.Parameters.AddWithValue("mk", tk.password);
        SqlDataReader dataReader = comand.ExecuteReader();
        dataReader.Read();
        string manguoidung = dataReader["quyen"].ToString();
        con.Close();
        return manguoidung;
    }
}