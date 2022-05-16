@project01
Feature: To get the booking details from Restful-Booker

  Background:
    * url baseUrl

  @getBookingIds @tc001
  Scenario: To view all the booking IDs present in the Restful-Booker
    Given path '/booking'
    When method GET
    Then status 200
    * def bookingID = response[0].bookingid

  @getBookingDetailsById @tc002
  Scenario Outline: To view booking details in Restful-Booker based on booking ID
    Given path 'booking',<ID>
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print 'First Name of :-->', response.firstname, 'Last Name of :-->', response.lastname
    * def firstName = response.firstname
    * def lastName = response.lastname

    @tc002-a
    Examples:
      | ID |
      | 1  |

    @tc002-b
    Examples:
      | ID |
      | 2  |

  @getBookingDetailsByName @tc003
  Scenario: To view booking details in Restful-Booker based on Name
    Given path 'booking/2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    Given path 'booking'
    And params {firstname: '#(response.firstname)', lastname: '#(response.lastname)'}
    When method GET
    Then status 200
    And match each response contains {bookingid: '#number'}

  @getBookingDetailsByCheckInDates @tc004
  Scenario: To view booking details in Restful-Booker based on checkin dates
    Given path 'booking'
    And param checkin = '2020-01-01'
    And param checkout = '2021-12-12'
    When method GET
    Then status 200
    And match each response contains {bookingid: '#number'}

  @getBookingDetailsUsingFeature
  Scenario: To view booking details in Restful-Booker based on Name using other feature
    * def bookingID = call read('GetBookingDetails.feature@getBookingDetailsById1')
    Given path 'booking'
    And params {firstname: '#(bookingID.firstName)', lastname: '#(bookingID.lastName)'}
    When method GET
    Then status 200
    And match response == '#[]? _.length >= 1'
    And match each response contains {bookingid: '#number'}