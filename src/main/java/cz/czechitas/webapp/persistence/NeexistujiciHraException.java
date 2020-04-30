package cz.czechitas.webapp.persistence;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class NeexistujiciHraException extends RuntimeException {

}
