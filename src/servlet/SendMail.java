package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Message;

public class sndmail extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String msg = "メール送信しました。";
    String text = "";

    // フォームデータ取得
    Enumeration names = request.getParameterNames();
    while (names.hasMoreElements()) {
      String name = (String)names.nextElement();
      text += "■" + name + ":\n" + request.getParameter(name) + "\n";
    }

    // メール送信
    try {
      Properties pt = System.getProperties();

      // SMTP サーバーアドレス
      pt.put("mail.smtp.host", "sak-design");

      // メール準備
      Session session = Session.getDefaultInstance(pt, null);
      MimeMessage ml = new MimeMessage(session);

      // 送信元
      ml.setFrom(new InternetAddress("sak@sak-design", "SAK", "iso-2022-jp"));

      // 送信先
      ml.setRecipients(Message.RecipientType.TO, "sak@sak-design");

      // 形式
      ml.setHeader("Content-Type", "text/plain");

      // タイトル
      ml.setSubject("タイトル", "iso-2022-jp");

      // 本文
      text = text.replace('①', '1');
      text = text.replace('②', '2');
      text = text.replace('③', '3');
      text = text.replace('④', '4');
      text = text.replace('⑤', '5');
      text = text.replace('⑥', '6');
      text = text.replace('⑦', '7');
      text = text.replace('⑧', '8');
      text = text.replace('⑨', '9');
      text = text.replace('～', '-');
      text = text.replace('－', '-');
      ml.setText(text, "iso-2022-jp");

      // 送信日
      ml.setSentDate(new Date());

      // 送信
      Transport.send(ml);

    } catch (Exception e) {
      msg = "メール送信エラー<BR>" + e.toString();
    }

    // 送信結果表示
    response.setContentType("text/html; charset=MS932");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">");
    out.println("<HTML>");
    out.println("<HEAD>");
    out.println("<META http-equiv=\"Content-Type\" content=\"text/html; charset=Shift_JIS\">");
    out.println("<TITLE>メール送信</TITLE>");
    out.println("</HEAD>");
    out.println("<BODY>");
    out.println("<P>" + msg + "</P>");
    out.println("</BODY>");
    out.println("</HTML>");
  }

}
