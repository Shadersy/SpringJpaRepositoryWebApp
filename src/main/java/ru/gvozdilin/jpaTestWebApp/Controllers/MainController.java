package ru.gvozdilin.jpaTestWebApp.Controllers;

import freemarker.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.gvozdilin.jpaTestWebApp.Entity.House;
import ru.gvozdilin.jpaTestWebApp.Repository.CustomizedHousesCrudRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {
//    private static freemarker.log.Logger log = Logger.getLogger(MainController.class.getName());
    private static final Logger log = Logger.getLogger(MainController.class.getName());


    @Autowired
    CustomizedHousesCrudRepository repository;

    @PersistenceContext
    EntityManager entityManager;




    @GetMapping("/main")
    @Transactional
    public String getAllHouses(Model model){
        Iterable<House> all = repository.findAll();
         List<House> maxIndication = repository.getMaxIndication();

          model.addAttribute("allHouses", all);
          model.addAttribute("maxIndication", maxIndication);





        for (House s : all) {
            log.info("Houses " + s.getAddress() + " " + s.getIndication());
        }

        for (House s : maxIndication) {
            log.info("maxIndication " + s.getAddress() + " " + s.getIndication());
        }

        return("main");
    }


    @PostMapping("/createHouse")
    public String createHouse(HttpServletRequest request) {
        String address = request.getParameter("address");
        log.info(address);
        repository.save(new House(address, 0L));
        return("redirect:/main");
    }

    @PostMapping("/deleteHouse")
    public String deleteHouse(HttpServletRequest request) {
          Long id = Long.parseLong(request.getParameter("deleteHouse"));
          repository.deleteById(id);
        return("redirect:/main");
    }

    @PostMapping("/createMeter")
    public String setIndication(HttpServletRequest request, Model model){
        Long id  = Long.parseLong(request.getParameter("createMeter"));
        Long indication = Long.parseLong(request.getParameter("valueOfMeter"));
        String error = "You entered an invalid value, please try again.";

        log.info("house id " + id + " indication " + indication);

        if(indication<0) {
            model.addAttribute("error", error);
            return("redirect:/main");
        }

        House house = entityManager.find(House.class, id); //Consider em as JPA EntityManager
        house.setIndication(indication);
        repository.save(house);
        return("redirect:/main");
    }

    @PostMapping("/showMaxIndication")
    public String showMaxIndication() {



        return("redirect:/main");
    }

}