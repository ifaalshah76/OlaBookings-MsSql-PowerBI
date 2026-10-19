**OLA Ride Booking Analysis --- Power BI**
**Project Overview**

This project uses Power BI to explore OLA ride-booking data and turn
booking records into insights about ride performance, revenue,
cancellations, vehicle categories, and customer/driver ratings.

The report is organized into five interactive pages: Overall,
Vehicle Type, Revenue, Cancellation, and Ratings. It
uses the Bookings table and includes date filtering to support
time-based analysis.
**Dashboard Pages
1. Overall**

Provides a high-level view of booking activity, including: - Booking
trends over time - Distribution of bookings by booking status -
Booking-value summary - Date-based filtering
**2. Vehicle Type**
Compares ride categories, including Prime Sedan, Prime SUV, Prime Plus,
Mini, Auto, Bike, and E-Bike. The report is designed to compare: - Total
booking value - Successful booking value - Average distance travelled -
Total distance travelled
**3. Revenue**
Focuses on the financial side of ride bookings, supporting analysis of
booking value and how value varies across the available booking
dimensions.
**4. Cancellation**
Examines cancellation patterns, including cancellations by drivers and
customers. The report includes cancellation-related visuals and a
cancellation-percentage metric to help assess booking drop-off.
**5. Ratings**
Compares driver and customer ratings across vehicle categories, helping
explore service experience and rating differences between ride types.
**Business Questions**
This report is designed to help investigate questions such as:
- How does booking activity change over time?
- What share of bookings are successful, cancelled, or in other
  statuses?
- Which vehicle categories contribute the most booking value?
- How do total and successful booking values compare by vehicle type?
- What are the average and total distances travelled by vehicle
  category?
- How frequently are rides cancelled by drivers versus customers?
- What is the cancellation rate?
- How do driver and customer ratings vary across vehicle types?
**Key Metrics and Analysis**
The report uses aggregations and measures around: - Booking volume -
Booking value and successful booking value - Average ride distance and
total distance travelled - Booking status distribution - Driver- and
customer-related cancellations - Cancellation percentage - Driver and
customer ratings

A cancellation-count measure is defined using the Bookings table and
the statuses Canceled by Driver and Canceled by Customer. The
cancellation rate is intended to be displayed as a percentage.
