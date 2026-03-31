program euler_method
    implicit none
    real :: mass, charge, E, g, dt
    real :: initial_velocity, initial_position
    real :: velocity, position
    integer :: i, n
    real :: t, error

    ! Given parameters
    mass = 0.01
    charge = 0.2
    E = 20.0
    g = -9.8
    initial_velocity = -1.52
    initial_position = 7.52

    ! Time step and total time
    dt = 0.01
    n = 1000 ! total number of steps

    ! Initial conditions
    velocity = initial_velocity
    position = initial_position

    ! Open output file
    open(unit=10, file='output.txt', status='replace')
    write(10,*) 'Time', 'Position', 'Velocity', 'Error'

    ! Time integration using Euler's method
    do i = 1, n
        t = i * dt
        ! Calculate acceleration
        real :: acceleration
        acceleration = (charge * E / mass) + g
        ! Update position and velocity
        velocity = velocity + acceleration * dt
        position = position + velocity * dt

        ! Calculate error (for demonstration purposes, we will use a dummy calculation)
        error = abs(position - (initial_position + initial_velocity * t + 0.5 * acceleration * t**2))

        ! Output results
        write(10,*) t, position, velocity, error
    end do

    ! Close output file
    close(10)

end program euler_method
