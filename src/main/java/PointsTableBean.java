import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PointsTableBean implements Serializable {
    private List<Point> points;
    public static final long serialVersionUID = 5L;


    public PointsTableBean() {
        points = new ArrayList<>();
    }

    int getN() {
        return points.size();
    }

    void addPoint(Point point) {
        points.add(point);
    }

    public List getPoints() {
        return points;
    }
}
