program euler_method
    implicit none
    real :: mass, charge, E, g, dt, acceleration
    real :: initial_velocity, initial_position
    real :: velocity, position, t
    real :: error, analytical_position
    integer :: i, max_steps

    ! Given parameters
    mass = 0.01        ! 10 gm in kg
    charge = 0.2       ! Charge in Coulombs
    E = 20.0           ! Electric field in V/m
    g = -9.8           ! Gravitational acceleration in m/s^2
    initial_velocity = -1.52   ! Initial velocity in m/s
    initial_position = 7.52    ! Initial position in m

    ! Time step parameters
    dt = 0.01          ! Time step in seconds
    max_steps = 10000  ! Maximum number of steps

    ! Initial conditions
    velocity = initial_velocity
    position = initial_position
    t = 0.0

    ! Calculate constant acceleration
    acceleration = (charge * E / mass) + g

    ! Open output file
    open(unit=10, file='euler_output.txt', status='replace')
    write(10,'(A)') 'Time(s), Position(m), Velocity(m/s), Error(%)'

    ! Print initial conditions to console
    print*, '=== Euler Method for Charged Particle Motion ==='
    print*, 'Mass:', mass, 'kg'
    print*, 'Charge:', charge, 'C'
    print*, 'Electric Field:', E, 'V/m'
    print*, 'Gravity:', g, 'm/s^2'
    print*, 'Acceleration:', acceleration, 'm/s^2'
    print*, ''
    print*, 'Initial Position:', initial_position, 'm'
    print*, 'Initial Velocity:', initial_velocity, 'm/s'
    print*, 'Time step:', dt, 's'
    print*, ''
    print*, 'Time(s), Position(m), Velocity(m/s), Error(%)'

    ! Euler's method integration
    do i = 0, max_steps
        t = i * dt

        ! Calculate analytical solution for error comparison
        analytical_position = initial_position + initial_velocity * t + 0.5 * acceleration * t**2

        ! Calculate percent error
        if (abs(analytical_position) > 1e-10) then
            error = abs((position - analytical_position) / analytical_position) * 100.0
        else
            error = abs(position - analytical_position) * 100.0
        end if

        ! Output to file and console
        write(10,'(F10.4,A,F12.6,A,F12.6,A,F12.6)') t, ',', position, ',', velocity, ',', error
        if (mod(i, 50) == 0) then
            print'(F10.4,A,F12.6,A,F12.6,A,F12.6)', t, ',', position, ',', velocity, ',', error
        end if

        ! Stop when velocity reaches 1.52 m/s
        if (velocity >= 1.52) then
            print*, ''
            print*, 'Target velocity reached!'
            print*, 'Final Time:', t, 's'
            print*, 'Final Position:', position, 'm'
            print*, 'Final Velocity:', velocity, 'm/s'
            print*, 'Final Error:', error, '%'
            exit
        end if

        ! Euler method: update velocity and position
        velocity = velocity + acceleration * dt
        position = position + velocity * dt

    end do

    ! Close output file
    close(10)
    print*, ''
    print*, 'Results saved to euler_output.txt'
end program euler_method