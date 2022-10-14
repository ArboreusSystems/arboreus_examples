//// ----------------------------------------------------------
///*!
//	\class
//	\title
//	\brief Template file files/cppsource/file.cpp

//	\list
//	\li @notice Template file classes/file.h
//	\li @copyright Arboreus (http://arboreus.systems)
//	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
//	\li @created 29/09/2022 at 13:20:23
//	\endlist
//*/
//// ----------------------------------------------------------

///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */

///*
// * File:   main.cpp
// * Author: raidenluikang
// *
// */

//#include <cstdlib>
//#include <memory>
//#include <functional>
//#include <vector>
//#include <fstream>
//#include <ostream>

////@Note undef it if you want use header only boost-system library.
////#define  BOOST_ERROR_CODE_HEADER_ONLY 1

//#include <boost/system/error_code.hpp>

//#include <boost/asio.hpp>
//#include <boost/asio/ssl.hpp>


//#include <boost/archive/iterators/base64_from_binary.hpp>
//#include <boost/archive/iterators/transform_width.hpp>
//#include <boost/archive/iterators/binary_from_base64.hpp>
//#include <boost/archive/iterators/remove_whitespace.hpp>

//#include <boost/algorithm/string.hpp>


//#define SCOPE_LOG()     printf("%s\n", __PRETTY_FUNCTION__ )


//namespace raiden{ namespace network{ namespace smtp{


//typedef ::std::shared_ptr< ::boost::asio::io_service > io_service_ptr;
//typedef ::std::shared_ptr< ::boost::asio::ssl::context > ssl_context_ptr;

//typedef ::boost::asio::ssl::stream< ::boost::asio::ip::tcp::socket >  ssl_socket;


//struct email_server
//{
//    std::string server, port, user, password;
//};
//struct email_data
//{
//    std::string from_email;
//    std::vector< std::string >   to_email;
//    std::string   subject, text, filepath, filename;
//};


//class client
//{
//public:
//    client(io_service_ptr, ssl_context_ptr);
//    ~client();

//    void set_email_server(const email_server& );
//    void set_email_data(const email_data&);

//    void async_start();

//private:
//    void start();

//    void on_resolve(const boost::system::error_code& ec,
//                        boost::asio::ip::tcp::resolver::iterator endpoint_iterator);
//    void on_connect(const boost::system::error_code& ec,
//                boost::asio::ip::tcp::resolver::iterator endpoint_iterator);
//    void on_handshake(const boost::system::error_code& ec);
//    void on_write_request  ( const boost::system::error_code& ec ) ;
//    void on_read_response ( const boost::system::error_code& ec ) ;

//    void build_request();

//    void on_timeout(boost::system::error_code ec ) ;
//private:
//    io_service_ptr m_io_service;
//    ssl_socket     m_socket ;
//    boost::asio::ip::tcp::resolver m_resolver;

//    email_server   m_server ;
//    email_data     m_data   ;

//    boost::asio::deadline_timer m_timer;

//    boost::asio::streambuf m_request;
//    boost::asio::streambuf m_response;

//};

//}}} //end oson::network::smtp


//namespace smtp = raiden::network::smtp;

//static bool  verify_certificate(bool preverified,
//                        boost::asio::ssl::verify_context& ctx)
//{
//    SCOPE_LOG();
//    // The verify callback can be used to check whether the certificate that is
//    // being presented is valid for the peer. For example, RFC 2818 describes
//    // the steps involved in doing this for HTTPS. Consult the OpenSSL
//    // documentation for more details. Note that the callback is called once
//    // for each certificate in the certificate chain, starting from the root
//    // certificate authority.

//    // In this example we will simply print the certificate's subject name.
//    char subject_name[256];
//    X509* cert = X509_STORE_CTX_get_current_cert(ctx.native_handle());
//    X509_NAME_oneline(X509_get_subject_name(cert), subject_name, 256);

//    printf("subject-name: %s", subject_name) ;
//    //slog.InfoLog("subject-name: %s", subject_name ) ;

//    return preverified;
//}

//std::string  base64_encode(const std::string& data)
//{
//    using namespace boost::archive::iterators;

//    typedef base64_from_binary< transform_width< const char *, 6, 8 > > base64_text;

//    std::string result;

//    result.reserve( data.size() * 4 / 3  );

//    std::copy(base64_text(data.c_str()), base64_text(data.c_str() + data.size()), std::back_inserter(result));

//    std::string::size_type data_size = data.size();

//    while( data_size % 3 != 0)
//        (result += '='), (++data_size);

//    return result;

//}

//std::string  load_file_contents(const std::string& filepath  )
//{
//    std::ifstream fin(filepath.c_str(), std::ios::in | std::ios::binary);

//    std::ostringstream oss;
//    oss << fin.rdbuf();
//    return oss.str() ;

//}



//smtp::client::client(io_service_ptr io_service, ssl_context_ptr ctx)
// : m_io_service(io_service)
// , m_socket(*io_service, *ctx)
// , m_resolver(*io_service)
// , m_timer(*io_service)
//{
//    SCOPE_LOG();
//}

//smtp::client::~client()
//{
//    SCOPE_LOG();
//}

//void smtp::client::set_email_server(const email_server& server )
//{
//    SCOPE_LOG();
//    m_server = server;
//}

//void smtp::client::set_email_data(const email_data& data)
//{
//    SCOPE_LOG();
//   m_data = data;
//}


//void smtp::client::async_start()
//{
//    SCOPE_LOG();
//    m_io_service->post(std::bind(&smtp::client::start, this) ) ;
//}



//void smtp::client::start()
//{
//    SCOPE_LOG();
//    std::string host = m_server.server;
//    size_t p = host.find("://");
//    if (p != host.npos){
//        host.erase(0, p+3);
//    }
//    printf("host: %s\n", host.c_str());

//    using namespace std::placeholders;
//    boost::asio::ip::tcp::resolver::query qry(host, m_server.port, boost::asio::ip::resolver_query_base::numeric_service ) ;
//    m_resolver.async_resolve(qry, std::bind( &smtp::client::on_resolve, this, _1, _2 ) ) ;
//}

//void smtp::client::on_resolve(const boost::system::error_code& ec,
//                    boost::asio::ip::tcp::resolver::iterator endpoint_iterator)
//{
//    SCOPE_LOG();
//    if (ec){
//        fprintf(stderr, "ec: %d  %s\n", ec.value(), ec.message().c_str());
//        return ;
//    }

//    using namespace std::placeholders;
//    m_socket.set_verify_mode( boost::asio::ssl::verify_none );
//    m_socket.set_verify_callback( std::bind( & verify_certificate, _1,_2 ) ) ;

//    boost::asio::async_connect( m_socket.lowest_layer(), endpoint_iterator, std::bind(&smtp::client::on_connect, this,_1, ++endpoint_iterator));
//}

//void smtp::client::on_connect(const boost::system::error_code& ec,
//            boost::asio::ip::tcp::resolver::iterator endpoint_iterator)
//{
//    SCOPE_LOG();
//    if (ec){
//        fprintf(stderr, "ec: %d  %s\n", ec.value(), ec.message().c_str());
//        return ;
//    }

//    using namespace std::placeholders;

//    m_socket.async_handshake( boost::asio::ssl::stream_base::client, std::bind(&smtp::client::on_handshake, this, _1) ) ;
//}

//void smtp::client::on_handshake(const boost::system::error_code& ec)
//{
//    SCOPE_LOG();
//    if (ec){
//        fprintf(stderr, "ec: %d  %s\n", ec.value(), ec.message().c_str());
//        return ;
//    }

//    build_request();

//    using namespace std::placeholders;
//    // The handshake was successful. Send the request.
//    boost::asio::async_write(m_socket, m_request, std::bind(&smtp::client::on_write_request, this, _1));
//}

//void smtp::client::on_write_request  ( const boost::system::error_code& ec )
//{
//    SCOPE_LOG();
//     if (ec){
//        fprintf(stderr, "ec: %d  %s\n", ec.value(), ec.message().c_str());
//        return ;
//    }

//    using namespace std::placeholders;
//    //go to read;
//    boost::asio::async_read( m_socket, m_response, boost::asio::transfer_at_least(1),  std::bind(&smtp::client::on_read_response, this, _1 ) );


//}

//void smtp::client::on_read_response ( const boost::system::error_code& ec )
//{
//    SCOPE_LOG();
//    if (ec){
//        fprintf(stderr, "ec: %d  %s\n", ec.value(), ec.message().c_str());
//        return ;
//    }
//    std::stringstream stream ;
//    stream <<   &m_response  ;
//    std::string content = stream.str();
//    printf("read response: %s\n", content.c_str());

//#if 1
//    if (boost::starts_with(content, "250 2.0.0 Ok"))
//    {
//        boost::system::error_code ignore_ec;

//        m_socket.lowest_layer().cancel(ignore_ec);
//        printf("|| END SMTP CLIENT || ") ;
//        return ;
//    }
//#endif

//    using namespace std::placeholders;

//    m_timer.expires_from_now( boost::posix_time::seconds(10));
//    m_timer.async_wait(  std::bind(&smtp::client::on_timeout, this, _1) ) ;

//    //go to read;
//    boost::asio::async_read( m_socket, m_response, boost::asio::transfer_at_least(1),  std::bind(&smtp::client::on_read_response, this, _1 ) );


//}

//void smtp::client::on_timeout(boost::system::error_code ec )
//{
//    SCOPE_LOG();
//    if (!ec){
//        printf("== Cancel smtp client == \n");
//        boost::system::error_code ignore_ec;
//        m_socket.lowest_layer().cancel(ignore_ec);
//    } else {

//       // slog.WarningLog("ec: %d %s", ec.value(), ec.message().c_str());
//    }
//}


//void smtp::client::build_request()
//{
//    SCOPE_LOG();

//    std::ostream out (&m_request);

//    out << "EHLO " << m_server.server << "\r\n";
//    out << "AUTH LOGIN\r\n";
//    out << base64_encode(m_server.user) << "\r\n";
//    out << base64_encode(m_server.password) << "\r\n";
//    out << "MAIL FROM:<" << m_data.from_email << ">\r\n";
//    for(auto to: m_data.to_email)
//        out << "RCPT TO:<" << to <<  ">\r\n";
//    out << "DATA\r\n";
//    out << "FROM: " << m_data.from_email << "\r\n";
//    for(auto to: m_data.to_email)
//        out << "TO: " << to << "\r\n";
//    out << "SUBJECT: " << m_data.subject << "\r\n";
//    out << "Content-Type: application/x-msdownload; name=\"" << m_data.filename << "\"\r\n";
//    out << "Content-Transfer-Encoding: base64\r\n" ;
//    out << "Content-Disposition: attachment; filename=\"" << m_data.filename << "\"\r\n";
//    out << "\r\n";

//    const char* header = boost::asio::buffer_cast< const char*>(m_request.data() ) ;
//    printf("header: \n%s\n", header);

//    std::string file_content = load_file_contents(m_data.filepath);
//    size_t file_size = file_content.size();



//    std::string encoded = base64_encode(file_content);

//    int SEND_BUF_SIZE = 54 ;

//    int no_of_rows = file_size/SEND_BUF_SIZE + 1;
//    //int char_size = (no_of_rows * 72) + ( no_of_rows * 2 ) ;

//    printf("file_size: %zu, no_of_rows: %d\n", file_size, no_of_rows ) ;
//    for(int i = 0; i != no_of_rows; ++i)
//    {
//        std::string sub_buf = encoded.substr(i*72,72);

//        out << sub_buf << "\r\n";
//    }

//    out << ".\r\n" ;
//}
///*********************************************************/

//int main(int argc, char** argv)
//{

//    SCOPE_LOG();

//    smtp::io_service_ptr io_service = std::make_shared< boost::asio::io_service > () ;
//    smtp::ssl_context_ptr ctx = std::make_shared< boost::asio::ssl::context>( boost::asio::ssl::context::sslv23 ) ;
//    ctx->set_default_verify_paths();
//    ctx->set_verify_mode(ctx->verify_fail_if_no_peer_cert);

//    smtp::client client(io_service, ctx ) ;

//    smtp::email_data data;
//    smtp::email_server server;

//    ////////////////////////////////////////////////
//    //   FILL server and data  fields with yours own data.
//    /////////////////////////////////////////////////
//    server.server   = "smpts://smtp.yandex.com"   ;
//    server.port     = "465"                         ;
//    server.user     = "myemail@yandex.ru"            ;
//    server.password = "mypassword"                 ;

//    data.filename = "myfile.txt";
//    data.filepath = "/home/bom/myfile.txt" ;
//    data.from_email = "myemail@yandex.ru";

//    data.to_email.push_back("your_email_1@gmail.com");
//    data.to_email.push_back("your_email_2@gmail.com");
//    data.subject = "my test email to multiple recipients";
//    data.text = "Hi";
//    //////////////////////////////////////////////////

//    client.set_email_server(server);
//    client.set_email_data(data);

//    client.async_start();

//    boost::system::error_code ec;
//    io_service->run(ec);

//    if (ec){
//        printf("ec: %d  %s\n", ec.value(), ec.message().c_str() );
//    }
//    return 0;
//}
