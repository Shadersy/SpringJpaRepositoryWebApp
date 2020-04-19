package ru.gvozdilin.jpaTestWebApp.Entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class House {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String address;
    private Long indication;

    public House() {

    }

    public House(String address, Long indication){
        this.address=address;
        this.indication=indication;

    }


    public House(Long id, String address, Long indication) {
        this.address = address;
        this.indication = indication;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getIndication() {
        return indication;
    }

    public void setIndication(Long indication) {
        this.indication = indication;
    }
}
