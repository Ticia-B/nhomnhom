package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;

public class ServiceFactory {

    public static Service getService(String name) {

        switch (name) {
            case "useremployee":
                return new UserEmployeeService();
            case "useradmin":
                return new UserAdminService();
            case "userclient":
                return new UserClientService();
            case "edible":
                return new EdibleService();
            case "order":
                return new OrderService();
            default:
                break;
        }

        return null;
    }

}
