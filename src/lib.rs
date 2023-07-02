use std::net::TcpListener;

use actix_web::dev::Server;
use actix_web::{web, App, HttpServer};

pub mod configuration;
pub mod routes;
pub mod startup;

use crate::routes::{health_check, subscribe};

pub fn run(listener: TcpListener) -> Result<Server, std::io::Error> {
    let server = HttpServer::new(|| {
        App::new()
            .service(web::resource("/health_check").to(health_check))
            .service(web::resource("/subscriptions").to(subscribe))
    })
    .listen(listener)?
    .run();

    Ok(server)
}
