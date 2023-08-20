//package org.seating_arrangement_system.seat.plan;
//
//import org.seating_arrangement_system.db.dao.HallDao;
//import org.seating_arrangement_system.db.dao.RoomDao;
//import org.seating_arrangement_system.db.dao.SeatDao;
//import org.seating_arrangement_system.db.dao.StudentDao;
//import org.seating_arrangement_system.db.models.Hall;
//import org.seating_arrangement_system.db.models.Room;
//import org.seating_arrangement_system.db.models.Seat;
//import org.seating_arrangement_system.db.models.Student;
//
//import java.util.*;
//
//public class SeatPlanner {
//
//    public void truncate() {
//        new SeatDao().truncate();
//    }
//
//    public void plan() {
//        RoomDao roomDao = new RoomDao();
//        StudentDao studentDao = new StudentDao();
//        HallDao hallDao = new HallDao();
//
//        List<Hall> hallList = hallDao.getAll();
//
//        Map<Hall, List<Room>> hallWithRoom = new HashMap<>();
//
//        hallList.forEach(hall -> {
//            List<Room> rooms = roomDao.getAll(hall.getId());
//            hallWithRoom.put(hall, rooms);
//        });
//
//        Queue<Student> studentQ = new LinkedList<>(studentDao.getAll());
//
//        fitStudent(hallWithRoom, studentQ);
//    }
//
//    private void fitStudent(Map<Hall, List<Room>> hallMap, Queue<Student> students) {
//        hallMap.forEach((hall, rooms) -> {
//            Collections.shuffle((List<?>) students); // Shuffle the list of students randomly
//            rooms.forEach(room -> assignStudent(hall, room, students));
//        });
//    }
//    private void assignStudent(Hall hall, Room room, Queue<Student> studentQ) {
//        if (studentQ.isEmpty()) return;
//
//        List<Character> columnNames = new ArrayList<>();
//        for (int i = 0; i < room.getColumnNumber(); i++) {
//            columnNames.add((char) (65 + i)); // Assuming A corresponds to column 1, B corresponds to column 2, and so on
//        }
//        Collections.shuffle(columnNames); // Shuffle the list of column names randomly
//
//        List<String> seatIdentifiers = new ArrayList<>();
//        for (int j = 1; j <= room.getBenchNumber(); j++) {
//            seatIdentifiers.add(j + "X");
//            seatIdentifiers.add(j + "Y");
//        }
//        Collections.shuffle(seatIdentifiers); // Shuffle the list of seat identifiers randomly
//
//        for (Character colName : columnNames) {
//            for (String seatIdentifier : seatIdentifiers) {
//                if (studentQ.isEmpty()) return;
//                assignSeat(hall, studentQ, room, colName, seatIdentifier);
//            }
//        }
//    }
//
//
//    private static void assignSeat(Hall hall, Queue<Student> studentQ, Room room, char colName, String seat) {
//        Student student = studentQ.poll();
//        assert student != null;
//        Seat seatInfo = new Seat(
//                student.getId(),
//                student.getName(),
//                hall.getName() +"-"+ hall.getId(),
//                room.getRoomNumber(),
//                colName + seat
//        );
//        SeatDao seatDao = new SeatDao();
//        seatDao.insertSeat(seatInfo);
//    }
//}




package org.seating_arrangement_system.seat.plan;

import org.seating_arrangement_system.db.dao.HallDao;
import org.seating_arrangement_system.db.dao.RoomDao;
import org.seating_arrangement_system.db.dao.SeatDao;
import org.seating_arrangement_system.db.dao.StudentDao;
import org.seating_arrangement_system.db.models.Hall;
import org.seating_arrangement_system.db.models.Room;
import org.seating_arrangement_system.db.models.Seat;
import org.seating_arrangement_system.db.models.Student;

import java.util.*;

public class SeatPlanner {

    public void truncate() {
        new SeatDao().truncate();
    }

    public void plan() {
        RoomDao roomDao = new RoomDao();
        StudentDao studentDao = new StudentDao();
        HallDao hallDao = new HallDao();

        List<Hall> hallList = hallDao.getAll();

        Map<Hall, List<Room>> hallWithRoom = new HashMap<>();

        hallList.forEach(hall -> {
            List<Room> rooms = roomDao.getAll(hall.getId());
            hallWithRoom.put(hall, rooms);
        });

        Queue<Student> studentQ = new LinkedList<>(studentDao.getAll());

        fitStudent(hallWithRoom, studentQ);
    }

    private void fitStudent(Map<Hall, List<Room>> hallMap, Queue<Student> students) {
        hallMap.forEach((hall, rooms) -> {
            Collections.shuffle((List<?>) students); // Shuffle the list of students randomly
            rooms.forEach(room -> assignStudent(hall, room, students));
        });
    }

    private void assignStudent(Hall hall, Room room, Queue<Student> studentQ) {
        if (studentQ.isEmpty()) return;

        Map<Integer, Queue<Student>> studentsBySemester = new HashMap<>();

        while (!studentQ.isEmpty()) {
            Student student = studentQ.poll();
            assert student != null;
            studentsBySemester.computeIfAbsent(student.sem, key -> new LinkedList<>()).add(student);
        }

        studentsBySemester.forEach((semester, semesterStudents) -> {
            assignStudentsToTable(hall, room, semesterStudents);
        });
    }

    private void assignStudentsToTable(Hall hall, Room room, Queue<Student> students) {
        if (students.isEmpty()) return;

        List<Character> columnNames = new ArrayList<>();
        for (int i = 0; i < room.getColumnNumber(); i++) {
            columnNames.add((char) (65 + i)); // Assuming A corresponds to column 1, B corresponds to column 2, and so on
        }
        Collections.shuffle(columnNames); // Shuffle the list of column names randomly

        List<String> seatIdentifiers = new ArrayList<>();
        for (int j = 1; j <= room.getBrenchNumber(); j++) {
            seatIdentifiers.add(j + "X");
            seatIdentifiers.add(j + "Y");
        }
        Collections.shuffle(seatIdentifiers); // Shuffle the list of seat identifiers randomly

        for (Character colName : columnNames) {
            for (String seatIdentifier : seatIdentifiers) {
                if (students.isEmpty()) return;
                assignSeat(hall, students, room, colName, seatIdentifier);
            }
        }
    }

    private void assignSeat(Hall hall, Queue<Student> students, Room room, char colName, String seat) {
        Student student = students.poll();
        assert student != null;
        Seat seatInfo = new Seat(
                student.getId(),
                student.getName(),
                hall.getName() + "-" + hall.getId(),
                room.getRoomNumber(),
                colName + seat
        );
        SeatDao seatDao = new SeatDao();
        seatDao.insertSeat(seatInfo);
    }
}
