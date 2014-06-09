.onAttach <- function( libname, pkgname ) {

  options( acronyms = NULL ) 
  
  packageStartupMessage( 
    pkgname ,
    "-" ,
    utils::packageVersion(pkgname, libname),
    " provided by Decision Patterns" ,
    domain = NA
  )

}
