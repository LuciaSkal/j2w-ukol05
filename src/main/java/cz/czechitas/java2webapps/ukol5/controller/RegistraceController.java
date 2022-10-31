package cz.czechitas.java2webapps.ukol5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.time.LocalDate;

/**
 * Kontroler obsluhující registraci účastníků dětského tábora.
 */
@Controller
@RequestMapping("/")
public class RegistraceController {

  @GetMapping("")
  public ModelAndView index() {
    ModelAndView modelAndView = new ModelAndView("fillForm");
    modelAndView.addObject("form", new RegistrationForm());
    return modelAndView;
  }

  @PostMapping("")
  public Object form(@Valid @ModelAttribute("form") RegistrationForm form, BindingResult bindingResult) {
      if (bindingResult.hasErrors()) {
          return "fillForm";
      }

      int age = (form.getBirthDate().until(LocalDate.now()).getYears());
      if ( age >= 15 || age < 9 ) {
          return "ageAlert";
      }

      return new ModelAndView("registrationProceed")
            .addObject("registrationSuccess", "Registrace byla vytvořena.");
      }
}
