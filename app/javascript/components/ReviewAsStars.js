import React, { Component } from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash';


class ReviewAsStars extends Component {
  render() {
    const { ratingCount } = this.props;

    return (
      <div className='reviewAsStarsStarContainer'>
        { this.renderStars() }
        <span className='reviewAsStarsLabel'>
          { `${ratingCount} rating(s)`}
        </span>
      </div>
    );
  }

  renderStars() {
    const { averageRating } = this.props;

    return [
      _.times(5, (index) => {
        const className = function(){
          if (index < averageRating) {
            return 'reviewAsStarsStarItem reviewAsStarsStarItemSelected';
          } else {
            return 'reviewAsStarsStarItem';
          }
        }();

        return (
          <div key={ index } className={ className }>
            <label htmlFor={ `starRating${index}` } />
            <option
              value={ index + 1 }
              id={ `starRating${index}` }
            />
          </div>
        );
      })
    ];
  }
}

ReviewAsStars.propTypes = {
  averageRating: PropTypes.number,
  ratingCount: PropTypes.number
};

ReviewAsStars.defaultProps = {
  averageRating: 0,
  ratingCount: 0
};

export default ReviewAsStars;
